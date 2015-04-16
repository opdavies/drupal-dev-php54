class profile::apache {
  # Install and start Apache.
  $apache = hiera('apache')
  package { $apache: } ->
  service { $apache: }

  file { "/etc/httpd/vhosts.d":
    ensure => directory,
  }
}