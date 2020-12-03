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

rfc_search() {
        local script="
import re
import sys

def replace_title(s):
    g = re.search(r'<a.*>((\w|\s)+)</a>', s)
    if g:
        return g.group(1)
    return s

def replace_desc(s):
    g = re.search(r'<b>((\w|\s|[#&,!;:\.\/\\\(\)\-_])+)</b>', s)
    if g:
        return g.group(1)
    return s

res = filter(
    lambda x: x.startswith('<a href') or x.startswith('<b>'),
    [x.strip() for x in sys.stdin.readlines()]
)
res = map(replace_title, res)
res = map(replace_desc, res)

for i in res:
    print(i, '-', next(res))
"

        local query="https://datatracker.ietf.org/doc/search?name=$1&sort=&rfcs=on&by"
        curl $query 2> /dev/null |     \
        sed -r '/^\s*$/d' |            \
        grep -A 5 "td class=\"doc\"" | \
        python -c "$script"
}

