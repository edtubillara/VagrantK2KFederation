# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "vagrant_idp" do |vagrant_idp|
    vagrant_idp.vm.box = "ubuntu/zesty64"
    vagrant_idp.vm.network "private_network", ip: "192.168.50.7"
    vagrant_idp.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "6144"
        vb.cpus = "2"
    end
      vagrant_idp.vm.provision "shell", path: "install.sh", privileged: false, run: "always"
      vagrant_idp.vm.provision "shell", path: "idp-post-install.sh", privileged: false, run: "always"
  end #end vagrant_idp
  config.vm.define "vagrant_sp" do |vagrant_sp|
    vagrant_sp.vm.box = "ubuntu/zesty64"
    vagrant_sp.vm.network "private_network", ip: "192.168.50.8"
    vagrant_sp.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "6144"
        vb.cpus = "2"
    end
      vagrant_sp.vm.provision "shell", path: "install.sh", privileged: false, run: "always"
      vagrant_sp.vm.provision "shell", path: "sp-post-install.sh", privileged: false, run: "always"
  end #end vagrant_sp
end
