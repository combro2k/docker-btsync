#!/bin/bash
set -e

if [[ ! -f "/opt/btsync/btsync.conf" ]]
then
   /opt/btsync/btsync --dump-sample-config > /opt/btsync/btsync.conf
fi

/opt/btsync/btsync --config /opt/btsync/btsync.conf --nodaemon
