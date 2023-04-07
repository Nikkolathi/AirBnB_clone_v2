#!/usr/bin/env bash
#a Bash script that sets up your web servers for the deployment of web_static. It must:
#Install Nginx if it not already installed
#Create the folder /data/ if it doesn’t already exist
#Create the folder /data/web_static/ if it doesn’t already exist
#Create the folder /data/web_static/releases/ if it doesn’t already exist
#Create the folder /data/web_static/shared/ if it doesn’t already exist
#Create the folder /data/web_static/releases/test/ if it doesn’t already exist
#Create a fake HTML file /data/web_static/releases/test/index.html (with simple content, to test your Nginx configuration)

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>">> /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data/
conf="\\\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}"
sudo sed -i "45i $conf" /etc/nginx/sites-available/default
sudo service nginx start
sudo service nginx restart
sudo service nginx reload
