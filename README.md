# Auto Installation
You can install driver in automatically mode or manually.
To install driver automatically run in console:

curl -sSf https://raw.githubusercontent.com/MarcO-79/tbs-install/main/drv-tbs.sh | sh


# lamp-server
This is LAMP Server (PHP 7.4.3 + Apache 2.4 + MySQL 8.0.19 + phpMyAdmin 5.0.1)


# Install
git clone https://github.com/MarcO-79/lamp-server.git

cd lamp-server

# Start
docker-compose up -d

# Stop
docker-compose down

# Runing Server
ip_address:8080 -> Web pages

ip_address:8090 -> phpMyAdmin pages
