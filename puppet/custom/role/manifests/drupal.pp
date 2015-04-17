class role::drupal inherits role::web {
  include profile::php
  include profile::mysql
}