mkdir /disks /disks/elements
chown -R plex:plex /disks

mount_point="
#Plex Library
UUID=CC94BC7094BC5EA0 /disks/elements ntfs defaults,auto,rw,nofail 0 1
"
printf "$mount_point" >> /etc/fstab

umount /media/pi/Elements
mount /disks/elements