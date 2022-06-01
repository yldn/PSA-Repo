
#localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#3 basic applications
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

## set stateless

iptables -t raw -A PREROUTING -p tcp --dport 80 -j NOTRACK
iptables -t raw -A PREROUTING -p tcp --sport 80 -j NOTRACK

iptables -t raw -A PREROUTING -p tcp --dport 443 -j NOTRACK
iptables -t raw -A PREROUTING -p tcp --sport 443 -j NOTRACK

iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT

#dns
iptables -A INPUT -p udp --sport 53 -j ACCEPT
iptables -A INPUT -p tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
#Haus-Netz
iptables -A OUTPUT -d 131.159.0.0/16 -j ACCEPT

#InterTeam Subnetz
iptables -A OUTPUT -o enp0s8 -d 192.168.5.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.51.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.52.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.53.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.54.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.65.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.75.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.85.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.95.0/24 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -d 192.168.105.0/24 -j ACCEPT

#ICMP
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT

#external(de.ubuntu)
iptables -A INPUT -s de.archive.ubuntu.com -p all -j ACCEPT
iptables -A OUTPUT -d de.archive.ubuntu.com -p all -j ACCEPT

#Proxy Server
iptables -A INPUT -p tcp --sport 8080 -s proxy.in.tum.de -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8080 -s proxy.in.tum.de -j ACCEPT
