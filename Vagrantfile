# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box      = "ubuntu/trusty64"

  config.vm.hostname = "personal-vagrant"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "sync/", "/srv/sync", create: true

  config.vm.provision "shell", inline: <<-CMD
    sudo apt-get update \\
    && sudo apt-get install -y ruby2.0 git \\
    && sudo gem2.0 i bundler --no-rdoc --no-ri
  CMD

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
