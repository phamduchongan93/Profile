mg create -f qcow2 /tmp/centos.qcow2 10G
# virt-install --virt-type kvm --name centos --ram 1024 \
	  --disk /tmp/centos.qcow2,format=qcow2 \
		  --network network=default \
			  --graphics vnc,listen=0.0.0.0 --noautoconsole \
				  --os-type=linux --os-variant=centos7.0 \
					  --location=/data/isos/CentOS-7-x86_64-NetInstall-1611.iso

https://docs.openstack.org/image-guide/virt-install.html
