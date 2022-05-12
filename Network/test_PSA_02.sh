#!/bin/bash

echo "Testing connectivity in the PSA-Net..."
for group in {1..10}; do 
   ping -c 3 192.168.${group}.1 >/dev/null && echo "Group${group} success" || "Group${group} fail"
done

echo "--------------------------------"
echo "Testing Redirects"
grep [01] /proc/sys/net/ipv4/conf/*/accept_redirects

echo "---------------------------------"
echo "Testing Forwarding "
cat /proc/sys/net/ipv4/ip_forward

echo "---------------------------------"
echo "Testing Firewall"
iptables -L -n

echo "---------------------------------"
echo "Testing apt-get"
apt-get update

