# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box      = "opscode/ubuntu-14.04"
  config.vm.box_url  = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"

  config.vm.hostname = "personal-vagrant"
  config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network :forwarded_port, guest: 80, host: 8080
  #config.vm.network :forwarded_port, guest: 443, host: 8443

  config.vm.synced_folder "sync/", "/srv/sync", create: true

  config.vm.provision "shell",
    inline: "apt-get update && apt-get -y upgrade"

  config.vm.provision "chef_zero" do |chef|
    chef.add_recipe 'base'
    chef.add_recipe 'anyenv'
  end
end
