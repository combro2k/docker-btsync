#!/bin/bash
set -e

if [[ ! -f "/data/btsync.conf" ]]
then
   /opt/btsync/btsync --dump-sample-config > /data/btsync.conf
fi

/opt/btsync/btsync --config /data/btsync.conf --nodaemon
