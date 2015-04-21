require 'yaml'

dir = File.dirname(File.expand_path(__FILE__))
configValues = YAML.load_file("#{dir}/config.yaml")
data = configValues['vagrantfile-local']

Vagrant.configure(2) do |config|

  config.vm.box = "#{data['vm']['box']}"
  config.vm.host_name = "#{data['vm']['hostname']}" + '.' + "#{data['vm']['domain']}"
  config.vm.synced_folder "web", "/var/www/html"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      'modifyvm', :id,
      '--name' , "#{data['vm']['hostname']} + '.' + #{data['vm']['domain']}",
      '--memory', "#{data['vm']['memory']}"
    ]
  end

  # Map network ports to local ports
  if data['vm']['network']['private_network'].to_s != ''
    config.vm.network "private_network", ip: "#{data['vm']['network']['private_network']}"
  end

  data['vm']['network']['forwarded_port'].each do |i, port|
    if port['guest'] != '' && port['host'] != ''
      config.vm.network :forwarded_port, guest: port['guest'].to_i, host: port['host'].to_i
    end
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