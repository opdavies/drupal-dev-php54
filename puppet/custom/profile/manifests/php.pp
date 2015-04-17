class profile::php {
  # Install PHP.
  $php_modules = hiera('php::modules')
  $apache = hiera('apache')
    package { $php_modules:
      notify => Service[$apache]
  }
}