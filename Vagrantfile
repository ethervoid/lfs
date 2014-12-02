# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

lfs_disk = '/Users/ethervoid/development/lab/lfs/lfs.vdi'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "lfs-host"
    config.vm.box_url = "https://www.dropbox.com/s/gxouugzbnjlny1k/debian-7.0-amd64-minimal.box?dl=1"
    config.vm.provision "shell", path: "provision.sh"
    config.vm.synced_folder "/Users/ethervoid/development/lab/lfs/stuff", "/home/vagrant/stuff"

    config.vm.provider "virtualbox" do |vb|
        unless File.exist?(lfs_disk)
            vb.customize ['createhd', '--filename', lfs_disk, '--size', 10000]
        end
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', lfs_disk]
    end

end
