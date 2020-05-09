all:
	vagrant plugin install vagrant-vbguest

update:
	vagrant plugin update
	vagrant vbguest

%:
	vagrant $*

.PHONY: all update
