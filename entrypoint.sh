#!/usr/bin/env bash

# Proxy signals
sp_processes=("jsipfs")
. ./signalproxy.sh

# Overload Traps
    #none

# Configure Stuff
export IPFS_PATH=$IPFS_PATH

if ! [[ -f "$IPFS_PATH/config" ]]; then
    jsipfs init    
fi

# Run App
jsipfs daemon & \
wait -n