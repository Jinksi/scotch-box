# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.15"
    config.vm.hostname = "thrive-box.dev"
    config.vm.synced_folder "./", "/var/www", type:"nfs", mount_options:["nolock,vers=3,udp,noatime,actimeo=1"]
    config.vm.provision :shell, path: "bootstrap.sh"
    config.vm.provider :virtualbox do |v|

      # Set the box name in VirtualBox to match the working directory.
      v_pwd = Dir.pwd
      v.name = File.basename(v_pwd)
      v.memory = 4096
      v.cpus = 4

    end

    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }

    if Vagrant.has_plugin? 'vagrant-triggers'
      config.trigger.before :halt, :stdout => true, :force => true do
        info "Exporting DB"
        run "vagrant ssh -c 'cd /var/www/public && wp db export'"
      end
    else
      puts 'vagrant-triggers missing, please install the plugin:'
      puts 'vagrant plugin install vagrant-triggers'
    end

end
