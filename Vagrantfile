# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/testing64"

  config.vm.hostname = "debian-vagrant"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "sync/", "/srv/sync", create: true
  config.vm.synced_folder "debian-setup/", "/srv/debian-setup", create: true

  config.vm.provision "shell", inline: <<-CMD
    sudo apt update && \\
    sudo apt -y full-upgrade && \\
    sudo apt install -y ansible
  CMD
end
