# Scripts to setup Plex Media Server on a Raspberry Pi

## Installation Steps

0. (Optional) Enable VNC
1. `git clone https://github.com/andre-lameirinhas/raspberrypi-setup.git`
2. `cd raspberrypi-setup`
3. `chmod +x plex_setup.sh set_library.sh`
4. `./plex_setup.sh`
5. `./set_library.sh`
6. Go to localhost:32400/web
7. Login into Plex
8. Connect Libraries to folders

## Scripts Description

### plex_setup.sh
Download and install plex

### set_library.sh
Set the plex library on the external hdd

### monitoring_setup.sh
Setup a node_exporter
