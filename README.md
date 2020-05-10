MY-VAGRANT
==========

Debian box for various work.


Memo
----

### Adding an external storage

* Create a storage on existing SATA controller, from VirtualBox console.
* Boot the box and find device path: `lsblk`
* Format the device in ext4: `mkfs.ext4 /dev/the/new/device`
* Create a directory for its mount point, e.g. `/ext`, and try mount: `mount /dev/the/new/device /ext`
* Mount automatically at boot by adding a new entry to `/etc/fstab`:
    * Something like: `/dev/the/new/device /ext ext4 defaults 0 0`
    * Check mounting: `mount`
* Reboot and check if the storage is mounted
