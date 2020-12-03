#!/usr/bin/env bash
# References:
# - https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands
# - https://www.digitalocean.com/community/tutorials/how-to-implement-a-basic-firewall-template-with-iptables-on-ubuntu-14-04
# - https://www.digitalocean.com/community/tutorials/a-deep-dive-into-iptables-and-netfilter-architecture

IPTABLES_CMD=$(which iptables)

#--------------------
#    Start clean
#--------------------

$IPTABLES_CMD -P INPUT DROP
$IPTABLES_CMD -P OUTPUT ACCEPT
$IPTABLES_CMD -P FORWARD DROP
$IPTABLES_CMD -F
$IPTABLES_CMD -X


#---------------------------------------
#    Create Protocol-specific chains
#---------------------------------------

$IPTABLES_CMD -N UDP
$IPTABLES_CMD -N TCP
$IPTABLES_CMD -N ICMP


#------------------------
#    TCP Traffic Chain
#------------------------

# Allow SSH traffic
$IPTABLES_CMD -A TCP -p tcp --dport 22 -j ACCEPT


#-----------------------------------------
#    Accept anything to/from loopback
#-----------------------------------------

$IPTABLES_CMD -A INPUT -i lo -j ACCEPT
$IPTABLES_CMD -I OUTPUT 1 -o lo -j ACCEPT


#---------------------------------------------------------------
# Accept all traffic that is part of an established connection
# or is related to an established connection.
#---------------------------------------------------------------

$IPTABLES_CMD -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


#-------------------------------
#     Drop invalid packets
#-------------------------------

$IPTABLES_CMD -A INPUT -m conntrack --ctstate INVALID -j DROP


#---------------------------------------------------
# Create the jump rules to protocol-specific chains
#---------------------------------------------------

$IPTABLES_CMD -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
$IPTABLES_CMD -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP
$IPTABLES_CMD -A INPUT -p icmp -m conntrack --ctstate NEW -j ICMP
