#!/bin/bash
tunnetwork="10.8.101.0"
tungw="10.8.101.1"
istun=$(ip r | grep ${tunnetwork} | wc -l)
if [ "$istun" -eq "1" ]; then
  for ipaddr in $(dig +short chatgpt.com)
  do
    count_of_rules=$(ip route | grep "${ipaddr}" | wc -l)
    if [ "$count_of_rules" -eq "0" ]; then
      ip route add ${ipaddr}/32 via ${tungw}
    fi
  done
fi
