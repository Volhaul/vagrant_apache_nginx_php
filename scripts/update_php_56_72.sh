#!/bin/sh
 sudo apt -y remove php5.6-fpm 
 sudo apt install php7.2-fpm libapache2-mod-php7.2
 sudo a2dismod php5.6
 sudo a2enmod php7.2