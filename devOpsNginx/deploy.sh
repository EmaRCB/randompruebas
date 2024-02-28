#!/bin/bash

# Detener NGINX
sudo systemctl stop nginx
# Detener NGROK
pkill ngrok
# Clonar repositorio
cd ..
git pull
# Encender NGINX y NGROK
sudo systemctl start nginx
# Extrae el url de NGROK y mostrarlo
ngrok_url=$(echo "ngrok http 8080" | awk '/^Forwarding/ {print $2}')
echo "NGROK URL: $ngrok_url"
