class profile::apache {
  # Install and start Apache.
  $apache = hiera('apache')
  package { $apache: } ->
  service { $apache: }
}