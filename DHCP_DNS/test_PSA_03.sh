#!/bin/bash

#test dns

for team in {1..10};  do
   if nslookup 192.168.$team.1 192.168.$team.3| grep "connection timed out" > /dev/null; then
        echo "Team $team has a dns problem."
   else
	  echo "-----DNS test team$team success"
    fi
 if nslookup vm01.psa-team0$team.in.tum.de 192.168.$team.3 | grep "connection timed out" > /dev/null; then
        echo "Team $team has a reverse dns problem."
 else
	  echo "-----Reverse DNS test team$team success"
     fi
done

if nslookup google.com | grep "connection time out" > /dev/null; then
        echo "fail to resolve google.com"
        else
        echo "-----DNS for google doesn't work"
     fi



## test the dhcp

echo "test dhcp"

if cat /var/lib/dhcp/dhclient.leases |grep "hardware ethernet 08:00:27:f8:6d:2c;" > /dev/null; then
        echo "the host is correctly assigned"
        else
        echo "-----the host is not correctly assigned"
     fi

