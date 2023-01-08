#!/usr/bin/env bash

# Proxy signals
sp_processes=("jsipfs")
. ./signalproxy.sh

# Overload Traps
    #none

# Configure Stuff
if [[ -d "$IPFS_PATH/repo.lock" ]]; then
    echo "Automatically removing a stale repo lock."
    rm -rf $IPFS_PATH/repo.lock    
fi

if ! [[ -f "$IPFS_PATH/config" ]]; then
    jsipfs init    
fi

# Run App
jsipfs daemon & \
wait -n