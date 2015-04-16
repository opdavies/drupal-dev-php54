class profile::php {
  # Install PHP.
  $php_modules = hiera('php::modules')
    package { $php_modules:
  }
}