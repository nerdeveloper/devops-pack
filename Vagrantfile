# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "devops-pack" do |devpack|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    devpack.vm.box = "ubuntu/xenial64"

    # Network Settings
    devpack.vm.synced_folder ".", "/home/vagrant"


    # Provider Settings
    devpack.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end

    # Provision Settings
    devpack.vm.provision "shell", path: "scripts/install.sh"
    end
  end
