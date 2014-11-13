# Rancher.
#
# Spins up 3 hosts.
#   * 1 x Management
#   * 2 x Nodes
#

domain = 'local'
nodes = [
  {
    :hostname  => 'rancher',
    :ip        => '192.168.1.52',
    :provision => "scripts/provision-management.sh",
  },{
    :hostname  => 'rancher-node1',
    :ip        => '192.168.1.53',
    :provision => "scripts/provision-node.sh",
  },{
    :hostname  => 'rancher-node2',
    :ip        => '192.168.1.54',
    :provision => "scripts/provision-node.sh",
  }
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      # Image.
      node_config.vm.box = 'phusion/ubuntu-14.04-amd64'

      # Networking.
      node_config.vm.host_name = node[:hostname] + '.local'
      node_config.vm.network :private_network, :ip => node[:ip]

      # Resources.
      memory = node[:ram] ? node[:ram] : 1024;
      node_config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--name",   node[:hostname]]
        vb.customize ["modifyvm", :id, "--memory", memory.to_s]
      end

      # Mounts.
      config.vm.synced_folder ".", "/vagrant"

      # Puppet.
      node_config.vm.provision "shell", path: "scripts/provision.sh"
      node_config.vm.provision "shell", path: node[:provision]
    end
  end
end
