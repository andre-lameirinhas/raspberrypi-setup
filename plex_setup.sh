#! /usr/bin/env bash
set -euo pipefail


# Set a static ip address
static_ip_config="
interface eth0
static ip_address=192.168.1.10/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1 1.1.1.1 8.8.8.8

interface wlan0
static ip_address=192.168.1.10/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1 1.1.1.1 8.8.8.8
"
printf "$static_ip_config" >> /etc/dhcpcd.conf

# Install plex media server
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt update
sudo apt install plexmediaserver
echo "plex installation finished with success"

# TODO add timestamp to logs
# convert crontab command to bash script
(crontab -l 2> /dev/null; echo "0 5 * * * sudo /bin/bash -c 'apt update; apt --only-upgrade install -y plexmediaserver >> /var/log/plex_upgrade.log'") | awk '!x[$0]++' | crontab -
echo "daily upgrade check set to 5am, logs on /var/log/plex_upgrade.log"
