# -*- mode: ruby -*-
# vi: set ft=ruby :

box = 'puppetlabs/centos-6.6-64-puppet'
hostname = 'drupaldev'
domain = 'local'
cpus = '1'
memory = '1024'
name = hostname + '.' + domain

Vagrant.configure(2) do |config|

  config.vm.box = box
  config.vm.hostname = name

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "web", "/var/www/html"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      'modifyvm', :id,
      '--name', name,
      '--memory', memory,
      '--cpus', cpus
    ]
  end

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = [ 'puppet/modules', 'puppet/custom' ]
    puppet.facter = {
      'vagrant' => '1',
      'role' => 'drupal'
    }
    puppet.hiera_config_path = 'puppet/hiera.yaml'
    puppet.working_directory = '/vagrant/puppet/hieradata'
  end

end
