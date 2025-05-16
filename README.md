# XSS_scan
Tool for xss scan
We need to used both the script to find a URL where your start performing your testing of XSS attack

1. First we need to run the recon.sh to filter out the subdomains.
Before running this tool please make sure that you have all the tools that are used in the recon.sh
# recon.sh
In the recon.sh script, there are bunch of different tools are added. First the script will do the subdomain enumeration by using subfinder, then for probing the live hosts we used httpx, after then the GAU (GetAllURLs) tool will collects all the URL.
The all urls that we have got after running the GAU tool, the filtering process will start. At the end we  will get the final param_urls.txt file.
Overall Script mechanism of recon.sh:
1. Tools ----------------------------------------------------------> Output
2. Subdomain enumeration --> tool --> Subfinder ----------> subdomains.txt (This file will used by next tool)
3. Probing for live hosts --> tool --> httpx -------------> live.txt (This file will be used by next tool)
4. Getting URLs ------------> tool --> GAU ---------------> urls.txt
5. Filtering URLs ----------> tool --> grep --------------> param_urls.txt

This param_urls.txt file will be used by xss_scan.sh script

2. Second we need to run the xss_scan.sh to find out the URLs which having potential of xss attack.
   This script uses the dalfox tool.
