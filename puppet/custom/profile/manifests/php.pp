class profile::php {
  include ::apache::mod::php

  # Install PHP.
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
}