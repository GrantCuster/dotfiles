#!/bin/sh

bluetooth_print() {
    echo -e '' | bluetoothctl | while read -r; do
        if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
            printf '#1'

            devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
            counter=0

            echo "$devices_paired" | while read -r line; do
                device_info=$(bluetoothctl info "$line")

                if echo "$device_info" | grep -q "Connected: yes"; then
                    device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

                    if [ $counter -gt 0 ]; then
                        printf ", %s" "$device_alias"
                    else
                        printf " %s" "$device_alias"
                    fi

                    counter=$((counter + 1))
                fi

                printf '\n'
            done
        else
            echo "#2"
        fi
    done
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac

