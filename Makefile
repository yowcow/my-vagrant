all: ubuntu-setup
	vagrant plugin install vagrant-vbguest

ubuntu-setup:
	git clone git@github.com:yowcow/ubuntu-setup.git $@

update:
	vagrant plugin update
	vagrant vbguest

%:
	vagrant $*

.PHONY: all update
