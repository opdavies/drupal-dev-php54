class role::drupal inherits role::web {
  include profile::php
  include profile::mysql
  include profile::drupal7
  include profile::drupal8
  include drush
}
