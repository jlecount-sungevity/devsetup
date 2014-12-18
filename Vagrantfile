Vagrant.configure("2") do |config|
  ## Choose your base box
  config.vm.box = "osx-final"
  ## config.vm.box = "precise64"

  ## For masterless, mount your salt file root
#  config.vm.synced_folder ".", "/devsetup"

  ## Enable port forwarding
  #config.vm.network :forwarded_port, host: 2222, guest: 22
  #config.ssh.guest_port = 2222
  #config.ssh.forward_agent = true
  #config.ssh.insert_key = true

  ## Use all the defaults:
#  config.vm.provision :salt do |salt|

 #   salt.minion_config = "salt/minion"
 #   salt.run_highstate = true

 # end
end
