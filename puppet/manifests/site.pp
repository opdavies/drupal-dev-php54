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
  }
}

if ($role) {
  include "role::${role}"
}