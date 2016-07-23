# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|	
  config.vm.define :neo do |neo|
  	neo.vm.hostname = "neo4j"
  	neo.vm.box = "ubuntu/trusty64"
  	neo.vm.network :forwarded_port, guest: 7473, host: 7473
  	neo.vm.network :forwarded_port, guest: 7474, host: 7474
  	neo.vm.network :forwarded_port, guest: 7687, host: 7687 
  	neo.vm.provision :shell, :path => "setup.sh"
  	neo.vm.provider "virtualbox" do |vb|    
      vb.memory = 1024
      vb.name = "neo"
    end
  end  
end
