#!/bin/bash

# Function to install required packages
install_packages() {
    if [ -f /etc/debian_version ]; then
        sudo apt update
        sudo apt install -y git ipset iptables
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y epel-release
        sudo yum install -y git ipset iptables
    elif [ -f /etc/almalinux-release ]; then
        sudo yum install -y epel-release
        sudo yum install -y git ipset iptables
    else
        echo "Unsupported OS. Please install git, ipset, and iptables manually."
        exit 1
    fi
}

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "git not found, installing..."
    install_packages
fi

# Check if ipset is installed
if ! command -v ipset &> /dev/null; then
    echo "ipset not found, installing..."
    install_packages
fi

# Check if iptables is installed
if ! command -v iptables &> /dev/null; then
    echo "iptables not found, installing..."
    install_packages
fi

# Check if the git repository exists
if [ ! -d "/tmp/proxy-blocklist" ]; then
    echo "Cloning the git repository..."
    cd /tmp
    git clone https://github.com/theraw/proxy-blocklist.git
fi

# Run the grab script
cd /tmp/proxy-blocklist/grabber/
bash grab.sh

# Create ipset and add IPs
ipset destroy banned_ips
(echo "create banned_ips hash:ip hashsize 4096 maxelem 100000000" && while IFS= read -r ip; do echo "add banned_ips $ip"; done < valid.txt) > ipset_batch.txt
ipset restore < ipset_batch.txt

# Add iptables rules
iptables -I INPUT -m set --match-set banned_ips src -j DROP
iptables -I OUTPUT -m set --match-set banned_ips dst -j DROP

echo "IP blocking setup completed successfully."
