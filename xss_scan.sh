#!/bin/bash

# Colors
green='\033[0;32m'
red='\033[0;31m'
blue='\033[0;34m'
nc='\033[0m' # No color

# Check if param_urls.txt exists
if [ ! -f "param_urls.txt" ]; then
    echo -e "${red}[!] param_urls.txt not found! Please run recon.sh first.${nc}"
    exit 1
fi

# Create output folder
mkdir -p xss-results

echo -e "${blue}[*] Starting Dalfox XSS scan...${nc}"

# Run Dalfox scan
~/go/bin/dalfox file param_urls.txt \
	--silence \
	--multicast \
	--custom-payload ./custom_payloads.txt \
	--format json \
	--output xss-results/dalfox_report.json

# Also save in TXT (for quick view)
~/go/bin/dalfox file param_urls.txt \
	--silence \
	--multicast \
	--custom-payload ./custom_payloads.txt \
	--output xss-results/dalfox_report.txt

echo -e "${green}[+] Pro XSS scan completed!${nc}"
echo -e "${green}[-] JSON report saved im: xss-results/dalfox_report.json${nc}"
echo -e "${green}[-] Text report saved in: xss-results/dalfox_report.txt${nc}"
