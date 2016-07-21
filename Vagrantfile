# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "neo4j"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 7473, host: 7473
  config.vm.network :forwarded_port, guest: 7474, host: 7474
  config.vm.network :forwarded_port, guest: 7687, host: 7687 
  config.vm.provision :shell, :path => "setup.sh"
  config.vm.provider "virtualbox" do |vb|    
    vb.memory = 1024
  end
end
