all:
	vagrant up

update:
	vagrant plugin update
	vagrant vbguest

.PHONY: all update
