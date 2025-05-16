#!/bin/bash

# Colors
green='\033[0;32m'
red='\033[0;31m'
blue='\033[0;34m'
nc='\033[0m' # No color

# Check if domain provided
if [ -z "$1" ]; then
	echo -e "${red}[!] Usage: $0 <target.com>${nc}"
	exit 1
fi

domain=$1
echo -e "${blue}[*] Starting reconnaissance for: $domain${nc}"

# Create output folder
mkdir -p recon-$domain
cd recon-$domain

# 1. Subdomain enumeration
echo -e "${green}[+] Running subfinder..${nc}"
subfinder -d $domain -silent -o subdomains.txt

# 2. Probing for live hosts
echo -e "${green}[+] Checking for live domains using httpx...${nc}"
cat subdomains.txt | ~/go/bin/httpx -silent -o live.txt

# 3. Getting URLs (gau)
echo -e "${green}[+] Collecting URLs with gau..${nc}"
cat live.txt | getallurls --o urls.txt

# 4. Filtering URLs with parameters
echo -e "${green}[+] Filtering URLs with parameters...${nc}"
cat urls.txt | grep "=" | tee param_urls.txt

echo -e "${blue}[*] Reconnaissance completed!{nc}"
echo -e "${green}[-] Subdomains saved in: recon-$domain/subdomains.txt"
echo -e "[-] Live domains saved in: recon-$domain/live.txt"
echo -e "[-] URLs with params saved in: recon-$domain/param_urls.txt${nc}"
