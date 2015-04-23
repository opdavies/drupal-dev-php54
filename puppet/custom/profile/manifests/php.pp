class profile::php {
  $php_modules = hiera('php::modules')
  $apache = hiera('apache')

  class { '::php':
    version => '5.4.40-1.el6.remi',
    require => [ Yumrepo['remi'], Package[$apache] ],
  }

  php::module { $php_modules:
    module_prefix => '',
    require => [ Yumrepo['remi'], Package[$apache] ],
  }

  # Enable mod_php.
  include ::apache::mod::php

  Ini_setting {
    ensure  => present,
    section => 'PHP',
    path    => '/etc/php.ini',
    notify  => Service[$apache],
  }

  # Set date.timezone.
  ini_setting { 'php-date-timezone':
    section => 'Date',
    setting => 'date.timezone',
    value   => 'Europe/London',
  }

  if ($vagrant) {
    # Display errors.
    ini_setting { 'php-display-errors':
      setting => 'display_errors',
      value   => 'On',
    }

    # Error reporting.
    ini_setting { 'php-error-reporting':
      setting => 'error_reporting',
      value => 'E_ALL',
    }
  }
}
