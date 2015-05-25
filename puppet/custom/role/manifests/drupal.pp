class role::drupal inherits role::web {
  include profile::php
  include profile::mysql
  include drush

  drupal_site { 'drupal7':
    enable => true,
  }

  drupal_site { 'drupal8':
    enable => true,
  }
}
