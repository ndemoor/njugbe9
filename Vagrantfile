Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "njugbe"

  config.vm.network :private_network, ip: "10.10.0.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "docker"
end
