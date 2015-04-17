class profile::apache {
  class { '::apache':
    mpm_module => 'prefork',
  }
}