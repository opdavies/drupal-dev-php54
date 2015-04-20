class drush {
  include composer

  $drush_version = hiera('drush::version')

  file { '/usr/local/sbin/drush':
    ensure => directory,
  }
  ->
  exec { 'install-drush':
    command     => "/usr/local/bin/composer require drush/drush:${$drush_version} -d /usr/local/sbin/drush",
    creates     => '/usr/local/sbin/drush/vendor/bin/drush',
    path        => "/bin:/usr/bin/:/sbin:/usr/sbin:${composer::target_dir}",
    environment => "COMPOSER_HOME=${composer::composer_home}",
    require     => [
      File['/usr/local/bin/composer', '/usr/local/sbin/drush'],
      Package['git', 'php'],
    ],
  }
  ->
  file { '/usr/bin/drush':
    ensure => link,
    target => '/usr/local/sbin/drush/vendor/drush/drush/drush',
  }
}