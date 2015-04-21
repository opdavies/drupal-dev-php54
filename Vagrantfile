# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "puppetlabs/centos-6.6-64-puppet"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "web", "/var/www/html"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = [ "puppet/modules", "puppet/custom" ]
    puppet.facter = {
      "vagrant" => "1",
      "role" => "drupal"
    }
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.working_directory = "/vagrant/puppet/hieradata"
  end

end
