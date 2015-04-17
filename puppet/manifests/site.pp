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

if ($role and defined(Class["role::${role}"])) {
  include "role::${role}"
}