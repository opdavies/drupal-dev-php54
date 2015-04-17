class profile::base {
  $base_packages = hiera('base::packages')
  package { $base_packages:
  }
}