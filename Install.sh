#!/bin/bash
 
#title           :lamp_setup.sh
#description     :The script will install all the required packages for laravel
#author		     :Alexandre Chabert
#date            :03033031
#version         :0.1
#==============================================================================
# Formal update for no reason
apt-get -y update
 
# Setup for packages
add-apt-repository -y ppa:ondrej/php
 
# Install apache
apt-get -y install apache2
echo -e "----Installed Apache----\n\n"
 
# Installing multiversions Proxy
apt-get install -y libapache2-mod-fcgid
a2enmod actions alias proxy_fcgi fcgid
service apache2 restart
 
# Install MySQL
#sudo apt-get -y install mysql-server
#echo -e "----Installed MySQL----\n\n"
 
# Install PHP 7
versions=($t 7.2 7.3 7.4)
for t in ${versions[@]}; do
  # echo $t
  apt-get install -y libapache2-mod-php$t php$t-fpm php$t-common php$t-cli php-pear php$t-curl php$t-gd php$t-gmp php$t-intl php$t-imap php$t-json php$t-soap php$t-ldap php$t-mbstring php$t-mcrypt php$t-mysql php$t-ps php$t-readline php$t-tidy php$t-xmlrpc php$t-xsl php$t-zip
  echo echo -e "----Installed PHP $t----\n\n"
done
 
## Install php 8
versions=($t 8.0 8.1 8.2)
for t in ${versions[@]}; do
  # echo $t
  apt-get install -y libapache2-mod-php$t php$t-fpm php$t-common php$t-cli php-pear php$t-curl php$t-gd php$t-gmp php$t-intl php$t-imap php$t-soap php$t-ldap php$t-mbstring php$t-mcrypt php$t-mysql php$t-ps php$t-readline php$t-tidy php$t-xmlrpc php$t-xsl php$t-zip
  echo echo -e "----Installed PHP $t----\n\n"
done
 
# Start and set apache
a2enmod rewrite
service apache2 start
service apache2 enable
echo -e "----Started Apache----\n\n"
 
# Start and set MySQl
#sudo service mysql start
#sudo service mysql enable
#echo -e "----Started MySQL----\n\n"
 
# Install Node, gulp and libnotify
# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
echo -e "----Installed Node and npm----\n\n"
 
# Install CertBot SSL
apt-get -y install certbot
apt-get -y install python3-certbot-apache
echo -e "----Installed CertBot Lets Encrypt----\n\n"
 
# Install Pacotes auxiliares
apt-get -y install dstat iotop tcpdump nload iperf net-tools
echo -e "----Installed another packages----\n\n"
 
# Install composer
curl -sS https://getcomposer.org/installer | php
sudo chmod +x composer.phar
sudo mv composer.phar /usr/bin/composer
echo -e "----Installed composer----\n\n"
