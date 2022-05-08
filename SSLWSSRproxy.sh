#!bin/sh

echo ""
echo "------------------------------------------"
echo ""
echo "Updating your packages and repositories..."
echo ""
echo "------------------------------------------"
echo ""

sleep 3

sudo apt-get update -y
sudo apt-get upgrade -y

echo ""
echo "--------------------------"
echo ""
echo "Installing Requirements..."
echo ""
echo "--------------------------"
echo ""
echo ""
echo "Please comply with the prompts where required"
echo ""

sleep 3

sudo apt-get -y install nginx

sudo apt-get install software-properties-common

sudo add-apt-repository universe

sudo add-apt-repository ppa:certbot/certbot

sudo apt-get update

sudo apt-get -y install certbot python3-certbot-nginx

echo ""
echo "-----------------------"
echo ""
echo "Awaiting your signal..."
echo ""
echo "-----------------------"
echo ""
echo ""
echo "Please follow the mandatory steps below:"
echo ""
echo "Navigate to CloudFlare.com and login"
echo "Choose the domain you want to have your website on"
echo "Select “DNS” from the menu at the top of the screen"
echo "Click “Add Record”"
echo "Set “Type” to “A”"
echo "Set “Name” to whatever you want your subdomain to be (Eg: www)"
echo "Set “IPv4 address” to the IP Address of your Machine"
echo "Set Proxy Status to "DNS Only""
echo "Click "Save""
echo ""
echo "NOTE: If you don't use cloudflare simply add you machine's ip"
echo "to an A record on your domain"
echo ""
read -p "Press Enter to Proceed
"

echo ""
echo "--------------------------"
echo ""
echo "Setting up Reverse Proxy..."
echo ""
echo "--------------------------"
echo ""
echo ""
echo "Please comply with the prompts where required"
echo ""

sleep 3

echo "What is the (sub)domain name you want to use for website? (Eg. www.yoursite.com)"                                                                                                                   
read ccdomain                                                                                                                                                     
                                                                                                                                                                  
echo "What is the IP address and the port of your website which it's running on (Eg. 192.168.1.101:1024)"                                                                                   
read ccip 

echo "Would you like http:// or https:// for the Proxy Pass"
echo "Type http or https"
read ccsec                                                                                                                                                        
                                                                                                                                                                  
echo " server {                                                                                                                                                   
        server_name $ccdomain;                                                                                                                                    
        listen 80;                                                                                                                                                
        listen [::]:80;                                                                                                                                           
        access_log /var/log/nginx/reverse-access.log;                                                                                                             
        error_log /var/log/nginx/reverse-error.log;                                                                                                               
        location / {                                                                                                                                              
                    proxy_pass $ccsec://$ccip;                                                                                                                      
  }                                                                                                                                                               
} " > /etc/nginx/sites-available/$ccdomain.conf                                                                                                                   
                                                                                                                                                                  
ln -s /etc/nginx/sites-available/$ccdomain.conf /etc/nginx/sites-enabled/$ccdomain.conf                                                                           
                                                                                                                                                                  
certbot --nginx                                                                                                                                                   
  
sudo service nginx reload

echo "Your virtual block of your reverse proxy is saved at (Primary) /etc/nginx/sites-enabled/$ccdomain.conf and"
echo "(Secondary) /etc/nginx/sites-available/$ccdomain.conf"
                                                                                                                                                                
echo "Your reverse proxy should now be ready and available at https://$ccdomain" 
