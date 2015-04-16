Package {
  ensure => installed,
}

$php_modules = hiera('php::modules')
package { $php_modules:
}