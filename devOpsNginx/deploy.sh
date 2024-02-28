#!/bin/bash

# Detener NGINX
sudo systemctl stop nginx

# Detener NGROK
pkill ngrok

# Clonar repositorio
cd randompruebas
git pull

# Encender NGINX y NGROK
sudo systemctl start nginx
ngrok_output=$(ngrok http 80)

# Extrae el url de NGROK y mostrarlo
ngrok_url=$(echo "$ngrok_output" | awk '/^Forwarding/ {print $2}')

echo "NGROK URL: $ngrok_url"
