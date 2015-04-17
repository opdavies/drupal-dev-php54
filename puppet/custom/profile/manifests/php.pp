class profile::php {
  include ::apache::mod::php

  # Install PHP.
  $php_modules = hiera('php::modules')
  $apache = hiera('apache')
    package { $php_modules:
      require => [ Yumrepo['remi'], Package[$apache] ],
      notify  => Service[$apache]
  }
}