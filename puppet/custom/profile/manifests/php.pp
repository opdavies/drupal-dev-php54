class profile::php {
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
}
