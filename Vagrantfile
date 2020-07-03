# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :debian do |node|
    node.vm.box = "bento/debian-10"

    node.vm.hostname = "dev-x28"
    node.vm.network "private_network", ip: "192.168.33.11"

    node.vm.synced_folder ".", "/vagrant", disabled: true
    node.vm.synced_folder "sync/", "/srv/sync", create: true
    node.vm.synced_folder "debian-setup/", "/srv/debian-setup", create: true

    node.vm.provider 'virtualbox' do |vb|
      vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
    end

    node.vm.provision "shell", inline: <<-CMD
      sudo apt update && \\
      sudo apt -y full-upgrade && \\
      sudo apt install -y ansible
    CMD
  end
end
