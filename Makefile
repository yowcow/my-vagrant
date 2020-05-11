all: debian-setup
	vagrant plugin install vagrant-vbguest

debian-setup:
	git clone git@github.com:yowcow/debian-setup.git $@

update:
	vagrant plugin update
	vagrant vbguest

%:
	vagrant $*

.PHONY: all update
