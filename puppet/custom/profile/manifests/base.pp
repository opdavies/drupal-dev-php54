class profile::base {
  # Install the remi repository.
  class { 'yum':
    extrarepo => ['remi'],
  }

  # Install packages.
  $base_packages = hiera('base::packages')
  package { $base_packages:
  }
}