# -*- mode: ruby -*-
# vi: set ft=ruby :

$bootstrap = <<-SHELL
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get update
sudo apt-get install -y oracle-java7-installer

sudo wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo apt-get install -y tmux tree ranger
echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"' | sudo tee --append /etc/default/docker

SHELL

def provision(config, name, ip, mem, fwd)
  config.vm.define name do |it|
    it.vm.box = "phusion/ubuntu-14.04-amd64"
    it.vm.provision :shell, inline: $bootstrap, privileged: false
    it.vm.hostname = name

    # --- private network ---
    it.vm.network "private_network", ip: "172.17.8.#{ip}"

    it.vm.provider "virtualbox" do |p|
      p.memory = "#{mem * 1024}"
    end

    it.vm.provider "vmware_fusion" do |p|
      p.memory = "#{mem * 1024}"
    end
  end
end

