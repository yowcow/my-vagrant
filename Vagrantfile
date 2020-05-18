# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.define :default do |node|
  #  node.vm.box = "bento/ubuntu-18.04"

  #  node.vm.hostname = "my-bionic"
  #  node.vm.network "private_network", ip: "192.168.33.10"

  #  node.vm.synced_folder "sync/", "/srv/sync", create: true

  #  node.vm.provision "shell", inline: <<-CMD
  #    sudo apt-get update \\
  #    && sudo apt-get install -y ifupdown zsh make ruby git tmux \\
  #    && sudo gem i bundler
  #  CMD
  #end

  config.vm.define :debian do |node|
    node.vm.box = "debian/testing64"

    node.vm.hostname = "debian-vagrant"
    node.vm.network "private_network", ip: "192.168.33.11"

    node.vm.synced_folder ".", "/vagrant", disabled: true
    node.vm.synced_folder "sync/", "/srv/sync", create: true
    node.vm.synced_folder "debian-setup/", "/srv/debian-setup", create: true

    node.vm.provision "shell", inline: <<-CMD
      sudo apt update && \\
      sudo apt -y full-upgrade && \\
      sudo apt install -y ansible
    CMD
  end
end
