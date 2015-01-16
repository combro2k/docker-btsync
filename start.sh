#!/bin/bash
set -e

if [ ! -z "$IPV6ADDR" ]; then
	echo  $IPV6ADDR
	ip -6 addr add "$IPV6ADDR" dev eth0
fi

sleep 2

if [ ! -z "$IPV6GW" ]; then
	echo $IPV6GW
	ip -6 route add  default via "$IPV6GW" dev eth0
fi

if [[ ! -f "/opt/btsync/btsync.conf" ]]
then
   /opt/btsync/btsync --dump-sample-config > /opt/btsync/btsync.conf
fi

chown btsync:btsync /data -R

sudo -u btsync /opt/btsync/btsync --config /opt/btsync/btsync.conf --nodaemon
