#!/bin/bash

if ! command -v curl &> /dev/null; then
    apt-get update && apt-get install -y curl
fi

PRIVATE_IP=$(curl -s -f http://169.254.169.254/latest/meta-data/local-ipv4)
echo "$PRIVATE_IP" > ~/private-ip-address.txt

chown ubuntu:ubuntu ~/private-ip-address.txt

if id "ubuntu" &>/dev/null; then
    echo "$PRIVATE_IP" > ~/private-ip-address.txt
    chown ubuntu:ubuntu ~/private-ip-address.txt
fi