#!/bin/bash

# Обновляем репозиторий и устанавливаем vim, wget, htop, tmux
apt -y update
apt -y install vim wget htop tmux

# Добавляем альтернативный репозиторий (т.к. в Debian 9 Stretch уже PHP 7) и устанавливаем PHP 5.6
apt -y install apt-transport-https lsb-release ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt update
apt -y install php5.6-fpm

# Установка nginx 
apt -y install nginx
mkdir -p /var/www/nginx_main /var/www/nginx_main/logs 

# Дефолтный конфиг нам не нужен
unlink /etc/nginx/sites-enabled/default

# Будем использовать свой конфиг
cat /vagrant/nginx/nginx.conf > /etc/nginx/sites-enabled/default

# Создаем тестовые index файлы (PHP и HTML) для проверки работоспособности nginx
echo '<?php echo "Hello from nginx!";phpinfo(); ?>' > /var/www/nginx_main/index.php
echo '<h1>Pure HTML from nginx</h1>' > /var/www/nginx_main/index.html

# Копируем тестовый PHP файл
cat /vagrant/scripts/test.php > /var/www/nginx_main/test.php

# Перезапускаем для применения конфига
service nginx restart

# Установка apache и соотв. модуля PHP для него
apt -y install apache2
service apache2 stop
apt -y install libapache2-mod-php5.6
mkdir -p /var/www/apache_main /var/www/apache_main/logs 

# Отключаем дефолтный конфиг
unlink /etc/apache2/sites-enabled/*default*

# И подключаем свой
cat /vagrant/apache/apache.conf > /etc/apache2/sites-enabled/default.conf

# Меняем порт по умолчанию  
cat /vagrant/apache/ports.conf > /etc/apache2/ports.conf

# Создаем тестовые index файлы (PHP и HTML) для проверки работоспособности apache
echo '<?php echo "Hello from apache!";phpinfo(); ?>' > /var/www/apache_main/index.php
echo '<h1>Pure HTML from apache</h1>' > /var/www/apache_main/index.html

# Копируем тестовый PHP файл
cat /vagrant/scripts/test.php > /var/www/apache_main/test.php

# Перезапускаем для применения конфига
service apache2 restart