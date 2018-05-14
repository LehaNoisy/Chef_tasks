
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
$node_num = 2
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  config.vm.box = "sbeliakou/centos-7.4-x86_64-minimal"

config.vm.define "chef-server" do |lb|
	lb.vm.network :private_network, ip: "10.0.0.10"
	lb.vm.hostname = "chef-server"
end

(1..$node_num).each do |i|
	config.vm.define "app-#{i}" do |node|
		node.vm.network :private_network, ip: "10.0.0.20#{i}"
		node.vm.hostname = "app-#{i}"
  	end
end

end
