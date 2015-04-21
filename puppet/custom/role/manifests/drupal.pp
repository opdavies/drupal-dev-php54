class role::drupal inherits role::web {
  include profile::php
  include profile::mysql
  include drush

  class { 'drupal_site':
    site_name => 'drupal7',
  }
}