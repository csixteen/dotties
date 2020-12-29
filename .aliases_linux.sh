#-----------------
# Gentoo specific
#-----------------

alias e='emerge --ask --verbose --deep --newuse'
alias es="emerge --sync"
alias euw='e --update @world'


#--------------------
#  Random shortcuts
#--------------------

alias kmodules="find /lib/modules/$(uname -r) -type f -name '*.ko*'"


#-----------------------------------------------------------------
# ProtonVPN - Check https://protonvpn.com/support/linux-vpn-tool/
#-----------------------------------------------------------------

# Assumes the `sdp` alias is defined: alias sdp='sudo env "PATH=$PATH" '

alias vpn_connect="sdp protonvpn c"
alias vpn_disconnect="sdp protonvpn d"
alias vpn_refresh="sdp protonvpn refresh"
alias vpn_status="sdp protonvpn s"
alias vpn_reconnect="sdp protonvpn r"
alias vpn_fast_conn="sdp protonvpn c --sc"
