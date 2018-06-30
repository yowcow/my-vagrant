# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

disk_path = "./external-disk.vdi"
# see `cat ~/.vagrant.d/boxes/*/virtualbox/box.ovf | grep -i storage`
# for storage controller name
storagectl_name = "SATA Controller"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.hostname = "my-bionic"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    unless File.exists?(disk_path)
      vb.customize [
        "createhd",
        "--filename", disk_path,
        "--variant", "Fixed",
        "--size", 100 * 1024,
      ]
    end
    vb.customize [
      "storageattach", :id,
      "--storagectl", storagectl_name,
      "--port", 1,
      "--device", 0,
      "--type", "hdd",
      "--medium", disk_path,
    ]
  end

  config.vm.provision "shell", inline: <<-CMD
    sudo apt-get update \\
    && sudo apt-get install -y ifupdown make ruby git \\
    && sudo gem i bundler --no-rdoc --no-ri
  CMD

  #config.vm.provider "virtualbox" do |vb|
  #  vb.memory = 4096
  #  vb.cpus = 2
  #end
end
