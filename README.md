#Migo

**Kernel** + **Busybox** x64 in **3MB**

##Kernel

[download](https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.1.3.tar.xz) ~ 80mb
open terminal in extracted directory, then
	
	make mrproper

copy **.config** file from **repository** to the **kernel** directory, then

	make # ~1,5 hour

or you can use the compiled kernel from **repository**: **bzImage** file

you need an **ext2**/**ext3**/**ext4** **primary** partition
create one, mount it, **cd** into it, then

create the basic filesystem:

	mkdir -pv {dev,proc,sys,run}
	mkdir {boot,bin,etc}
	sudo mknod -m 600 dev/console c 5 1
	sudo mknod -m 666 dev/null c 1 3

copy the **bzImage** file in **boot** directory


##Busybox

[download](http://www.busybox.net/downloads/binaries/latest/busybox-x86_64) ~ 1Mb

rename the file to **busybox**

copy it to the **bin** directory, then

	ln -s bin/busybox init

copy the **inittab** file from **repository** to **etc** directory

create all the links:

	cd bin
	for i in `busybox --list`; do ln busybox $i; done

##Bootloader

you need a boot loader
example: using an existing grub on debian

	sudo gedit /boot/grub/grub.cfg

add this somewhere (tip: near the end of file)

	menuentry "migo" {
		set root=(hd0,1)
		linux   /boot/bzImage root=/dev/sda1 init=init
	}