#! /usr/bin/env bash
set -uo pipefail

wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-armv7.tar.gz
tar xf node_exporter-1.3.1.linux-armv7.tar.gz
rm node_exporter-1.3.1.linux-armv7.tar.gz
NODE_EXPORTER=$(readlink -f node_exporter-1.3.1.linux-armv7/node_exporter)
# TODO remove duplicates
(crontab -l 2> /dev/null; echo "@reboot ${NODE_EXPORTER} &") | crontab -
echo "monitoring setup finished with success"
