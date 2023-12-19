#!/bin/bash

base_path="/var/lib/docker/containers"
text_to_check="helium"
text_to_add="3.76.147.207 nlb.iot.mainnet.helium.io
18.193.232.30 nlb.iot.mainnet.helium.io
3.122.172.188 nlb.iot.mainnet.helium.io
3.76.147.207 mainnet-pociot.helium.io
18.193.232.30 mainnet-pociot.helium.io
3.122.172.188 mainnet-pociot.helium.io"

# Find all subdirectories under the base path
for folder in "$base_path"/*/; do
    hosts_file="$folder/hosts"

    # Check if the hosts file exists
    if [ -f "$hosts_file" ]; then
        # Check if the file contains the specified text
        if ! grep -q "$text_to_check" "$hosts_file"; then
            # If not, append the text to the end of the file
            echo "$text_to_add" >>"$hosts_file"
            echo "Kayıtlar $hosts_file'na eklendi"
        else
            echo "Kayıtlar $hosts_file dosyasında zaten var."
        fi
    fi
done
