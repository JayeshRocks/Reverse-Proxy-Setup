# Reverse Proxy Setup

This is an automated script made for Linux machines, it setups and installs a reverse proxy with a ssl for your website

This script is also usable to create reverse proxy for any types of pages as it uses ngnix

# Usage:

For SSL Only:

- Type sudo su or sudo -i into your terminal to gain root access

- Paste the command line below into the terminal for Setup with only SSL

```bash
wget https://raw.githubusercontent.com/JayeshRocks/Reverse-Proxy-Setup/main/SSLonlyRproxy.sh && bash SSLonlyRproxy.sh
```

For SSL and WSS (Websockets):

- Type sudo su or sudo -i into your terminal to gain root access

- Paste the command line below into the terminal for Setup with SSL and WSS sockets

```bash
wget https://raw.githubusercontent.com/JayeshRocks/Reverse-Proxy-Setup/main/SSLWSSRproxy.sh && bash SSLWSSRproxy.sh
```
