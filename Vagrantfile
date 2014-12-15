Vagrant.configure("2") do |config|
  ## Choose your base box
  ##config.vm.box = "osx-yosemite"
  config.vm.box = "precise64"

  ## For masterless, mount your salt file root
  config.vm.synced_folder "salt/roots/", "/srv/"

  ## Enable port forwarding
  #config.vm.network :forwarded_port, host: 2222, guest: 22

  ## Use all the defaults:
  config.vm.provision :salt do |salt|

    salt.minion_config = "salt/minion"
    salt.run_highstate = true

  end
end
