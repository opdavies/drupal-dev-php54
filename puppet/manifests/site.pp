Package {
  ensure => installed,
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