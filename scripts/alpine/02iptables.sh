#!/bin/sh

set -eux

IFACE=${IFACE:-eth0}

apk add iptables
rc-update add iptables


# Flush existing rules
iptables -F
iptables -X
iptables -Z

# Set default filter policy
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Create a chain to log packet drop
iptables -N LOGDROP
iptables -A LOGDROP -j LOG
iptables -A LOGDROP -j DROP

# Flood protection
iptables -A INPUT -i $IFACE -p tcp --dport $SSHD_PORT \
	-m state --state NEW -m recent --set
iptables -A INPUT -i $IFACE -p tcp --dport $SSHD_PORT \
	-m state --state NEW -m recent  --update --seconds 60 --hitcount 51 \
	-j LOGDROP

# Only allow input connections to SSH
iptables -A INPUT -i $IFACE -p tcp --dport $SSHD_PORT \
	-m state --state NEW -j ACCEPT

# Ensure that everything else is dropped
iptables -A INPUT -j LOGDROP


/etc/init.d/iptables save
