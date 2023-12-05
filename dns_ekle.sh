#!/bin/sh

# Eklenmesi istenen metin
new_entries="3.76.147.207 nlb.iot.mainnet.helium.io
18.193.232.30 nlb.iot.mainnet.helium.io
3.122.172.188 nlb.iot.mainnet.helium.io
3.76.147.207 mainnet-pociot.helium.io
18.193.232.30 mainnet-pociot.helium.io
3.122.172.188 mainnet-pociot.helium.io"

# Hedef klasörü belirle
target_folder="/var/lib/docker/containers"

# Hedef klasördeki tüm klasörleri döngüye al
for container_id in "$target_folder"/*
do
    # Hosts dosyasinin tam yolu
    hosts_file="$container_id/hosts"

    # Eger dosya varsa, istenen metni ekleyin (append)
    if [ -f "$hosts_file" ]; then
        echo -e "$new_entries" >> "$hosts_file"
        echo "Metin basariyla eklendi: $hosts_file"
    else
        echo "Hata: $hosts_file bulunamadi veya bir dosya degil."
    fi
done
