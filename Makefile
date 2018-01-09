BOX = ubuntu-xenial64
FILE = xenial-server-cloudimg-amd64-vagrant.box
URL = http://cloud-images.ubuntu.com/xenial/current/$(FILE)

all: $(FILE)

$(FILE):
	curl -L $(URL) -o $@

update:
	vagrant plugin update
	vagrant vbguest

.PHONY: all
