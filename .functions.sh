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
