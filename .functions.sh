#!/usr/bin/env bash


check_battery() {
        percentage=$(                                                    \
                upower -i /org/freedesktop/UPower/devices/battery_BAT0 | \
                grep percentage |                                        \
                awk '{ print $2 }'                                       \
        )

        echo $percentage
}

scan_network() {
        IFACE=${1:-wlp1s0}
        sudo iw dev $IFACE scan | grep -E '(^BSS|SSID:)'
}

# Read an RFC as if it were a man page...sort of.
# Usage: rfc <RFC number> (e.g. 793)
rfc() {
        local rfc_file="https://tools.ietf.org/rfc/rfc${1}.txt"
        local rfc_exists=$(                                   \
                curl                                          \
                --max-time 5                                  \
                --retry 3                                     \
                --retry-delay 1                               \
                --head $rfc_file                              \
                2> /dev/null | head -n 1 | awk '{ print $2 }'
        )
        
        if [ $rfc_exists -ne 200 ]; then
                echo "[Error] No such RFC: $1"
        else
                curl $rfc_file 2> /dev/null | less
        fi
}
