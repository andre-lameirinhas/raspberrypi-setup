#! /usr/bin/env bash
set -euo pipefail


sudo mkdir -p /disks/elements
sudo chown -R plex:plex /disks

mount_point="
#Plex Library
UUID=CC94BC7094BC5EA0 /disks/elements ntfs defaults,auto,rw,nofail 0 1
"
sudo bash -c "printf '$mount_point' >> /etc/fstab"

umount /media/pi/Elements
sudo mount /disks/elements
