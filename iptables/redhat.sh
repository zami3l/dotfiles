#!/bin/bash

# Initialisation
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P FORWARD ACCEPT
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -Z
iptables -t filter -F
iptables -t filter -X
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -Z
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -P PREROUTING ACCEPT
iptables -t mangle -P INPUT ACCEPT
iptables -t mangle -P FORWARD ACCEPT
iptables -t mangle -P OUTPUT ACCEPT
iptables -t mangle -P POSTROUTING ACCEPT
iptables -t mangle -Z
iptables -t mangle -F
iptables -t mangle -X

# Default policy : DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Interface lo : ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Interfaces 
WAN='enp1s0'

# PING
iptables -A INPUT -i $WAN -p icmp -j ACCEPT
iptables -A OUTPUT -o $WAN -p icmp -j ACCEPT

# SSH
iptables -A INPUT -i $WAN -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -o $WAN -p tcp --sport 22 -j ACCEPT

# DNS
iptables -A INPUT -i $WAN -p tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -o $WAN -p tcp --dport 53 -j ACCEPT

# HTTP
iptables -A INPUT -i $WAN -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -o $WAN -p tcp --dport 80 -j ACCEPT

# HTTPS
iptables -A INPUT -i $WAN -p tcp --sport 443 -j ACCEPT
iptables -A OUTPUT -o $WAN -p tcp --dport 443 -j ACCEPT

