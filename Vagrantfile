# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :ubuntu do |node|
    config.vm.box = "bento/ubuntu-20.04"

    node.vm.hostname = "dev-x28"
    node.vm.network "private_network", ip: "192.168.57.11" # should be within the range 192.168.56.0/21

    node.vm.synced_folder ".", "/vagrant", disabled: true
    node.vm.synced_folder "sync/", "/srv/sync", create: true
    node.vm.synced_folder "ubuntu-setup/", "/srv/ubuntu-setup", create: true

    node.vm.provision "shell", inline: <<-CMD
      sudo apt update && \\
      sudo apt -y full-upgrade && \\
      sudo apt install -y ansible
    CMD
  end
end
