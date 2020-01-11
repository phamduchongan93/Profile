# Why using libvirt fa
- avoid incompatibility between virtualbox and vagrant.
- 
Mock-up command

# Step to set up your vagrant box 

```bash

vagrant box add centos/7 --provider=libvirt
# the vagrantfile will be generated, you now need to edit the Vagrantfile with following contenct


<Vagrant.configure("2") do |config|

  ##### DEFINE VM #####
  config.vm.define "myCentos" do |config|
  config.vm.hostname = "cent-01"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.18.9"
  config.vm.provider :libvirt do |v|
    v.memory = 1024
    end
  end
end
```



```
## Method 2: writing 
{
<Vagrant.configure("2") do |config|

  ##### DEFINE VM #####
  config.vm.define "cent-01" do |config|
  config.vm.hostname = "cent-01"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.18.9"
  config.vm.provider :libvirt do |v|
    v.memory = 1024
    end
  end
end
} > Vagrantfile
```
**Note**: Don't assume that the images downloaded from the cloud stable and ready to deploy as good as virtualbox providers is. When using libvirt, you have to define your vm in the Vagrantfile.

Sources used:
Known bug:
* https://github.com/vagrant-libvirt/vagrant-libvirt/issues/659
Offical documentation:
* https://computingforgeeks.com/using-vagrant-with-libvirt-on-linux/
https://docs.docker.com/install/linux/docker-ce/ubuntu/


