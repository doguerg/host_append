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
for container_id in $(ls "$target_folder")
do
    # Hosts dosyasının tam yolu
    hosts_file="$target_folder/$container_id/hosts"

    # Eğer dosya varsa, istenen metni ekleyin (append)
    if [ -f "$hosts_file" ]; then
        echo "$new_entries" >> "$hosts_file"
        echo "Metin başarıyla eklendi: $hosts_file"
    else
        echo "Hata: $hosts_file bulunamadı veya bir dosya değil."
    fi
done
