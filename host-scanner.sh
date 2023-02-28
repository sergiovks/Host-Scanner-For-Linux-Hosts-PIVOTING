#!/bin/bash

function ctrl_c(){
        echo -e "\n\n[!] Leaving...\n"
        tput cnorm; exit 1
}

#Ctrl+C
trap ctrl_c INT
tput civis

read -p "Enter the first three octets of the IP address (e.g., 10.10.0): " ip

for i in $(seq 1 254); do
        timeout 1 bash -c "ping -c 1 $ip.$i" &> /dev/null && echo "[+] The host $ip.$i is UP" &
done; wait

tput cnorm
