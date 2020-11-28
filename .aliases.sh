#------------
# Navigation
#------------

alias ..="cd .."
alias cd..="cd .."


#--------------------------------
# File manipulation - mv, rm, cp
#--------------------------------

alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'


#--------------------------------
# Networking and troubleshooting
#--------------------------------

# `dig` is essentially sending a request for the IP of `myip.opendns.com` to
# the nameserver `resolver1.opendns.com`. This nameserver automatically sends
# back the IP address of the originating request, as long as it has received
# that special request.
# The `+short` flag instructs `dig` to return a less verbose result.
alias my_ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Returns the IP addresses of all my interfaces
alias ips="ifconfig | grep -P \"inet\\s\" | awk '{ print \$2 }'"

# For quick troubleshooting. The `-e` flag prints the link-level on each dump line (e.g.
# MAC layer addresses for Ethernet). The `-vv` adds some extra verbosity (TTL, identification,
# total length, etc). Finally, the `-XX` prints the data of each packet in Hex and ASCII.
# Sometimes I use `-tt` to print UNIX timestamps at the beginning of each dump line.
alias tdump='tcpdump -e -vv -XX'

# Reports CPU statistics and I/O statistics for devices and partitions, every second.
alias iostat="iostat -xz 1"

# Displays both listening and non-listening TCP sockets, with the process info.
alias open_conn="ss -tanp"

# Watches for changes on all the open files whose descriptors represent network files. In other words,
# it continuously watches open connections.
alias watch_conn="watch -d -n1 lsof -i"


#-----------------
# Gentoo specific
#-----------------

alias e='emerge --ask --verbose --deep --newuse'
alias es="emerge --sync"
alias euw='e --update @world'


#--------------
#     Sudo
#--------------

# Allows me to run aliases as `sudo`. Essentially, if the last character of an alias is a blank,
# then the next command word is also checked for alias expansion. I prefer this to using something
# like alias sudo="sudo ".
# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases
alias sd='sudo '
# For some special cases, such as tools installed via pyenv-pip, which live under
# $HOME/.pyenv/shims/. No need to globally affect everything by changing sudoers.
alias sdp='sudo env "PATH=$PATH" '


#--------------------
#  Random shortcuts
#--------------------

alias g="git"
alias k="kubectl"
alias v="vim"
alias diskspace="df -P -kH"
alias kmodules="find /lib/modules/$(uname -r) -type f -name '*.ko*'"


#-----------------------------------------------------------------
# ProtonVPN - Check https://protonvpn.com/support/linux-vpn-tool/
#-----------------------------------------------------------------

alias vpn_connect="sdp protonvpn c"
alias vpn_disconnect="sdp protonvpn d"
alias vpn_refresh="sdp protonvpn refresh"
alias vpn_status="sdp protonvpn s"
alias vpn_reconnect="sdp protonvpn r"
alias vpn_fast_conn="sdp protonvpn c --sc"
