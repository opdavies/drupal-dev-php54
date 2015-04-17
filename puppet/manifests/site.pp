Package {
  ensure        => installed,
  allow_virtual => false,
}

Service {
  ensure => running,
  enable => true,
}

if ($vagrant) {
  service { 'iptables':
    ensure => stopped,
    enable => false,
  }
}

if ($role and defined("role::${role}")) {
  include "role::${role}"
}

class { 'drupal_site':
  site_name => 'drupal7',
}