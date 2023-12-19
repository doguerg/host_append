#!/bin/sh
new_entries="3.76.147.207 nlb.iot.mainnet.helium.io
18.193.232.30 nlb.iot.mainnet.helium.io
3.122.172.188 nlb.iot.mainnet.helium.io
3.76.147.207 mainnet-pociot.helium.io
18.193.232.30 mainnet-pociot.helium.io
3.122.172.188 mainnet-pociot.helium.io"
target_folder="/var/lib/docker/containers"
for container_id in "$target_folder"/*
do
    hosts_file="$container_id/hosts"
    if [ -f "$hosts_file" ]; then
        echo -e "$new_entries" >> "$hosts_file"
        echo "IP adresleri basariyla eklendi: $hosts_file"
    else
        echo "Hata: Yanlis yerde calistirdin ya da bu makinede $hosts_file klasoru yok."
    fi
done
