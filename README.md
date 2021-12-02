# vagrant_apache_nginx_php
Vagrant + VirtualBox sample deployment contains Debian 9, Nginx, Apache, PHP 5.6

## Установка (на примере Windows)

### 1. Устанавливаем актуальную версию Vagrant и VirtualBox


### 2. Скачиваем репозиторий с примером:

Запускаем PowerShell или cmd с правами администратора и выполняем команды:
   
c:
   
cd /
   
git clone https://github.com/Volhaul/vagrant_apache_nginx_php
   
cd /vagrant_apache_nginx_php


### 3. Запускаем сборку контейнера:
	
vagrant up

	
### 4. Apache и Nginx публикуются на порты хост машины 8888 и 80 соответственно. Доступны на всех сетевых интерфейсах. Проверяем работу веб серверов:
	
http://127.0.0.1:8888

http://127.0.0.1:8888/test.php

http://127.0.0.1:8888/index.html


http://127.0.0.1:80

http://127.0.0.1:80/test.php

http://127.0.0.1:80/index.html
	

### 5. Для обновления PHP5.6 до PHP7.2 запускаем скрипт /vagrant/scripts/update_php_56_72.sh в SSH сессии виртуальной машины:
   
vagrant ssh

/vagrant/scripts/update_php_56_72.sh
   
Проверяем в PHPInfo версию:  http://127.0.0.1:8888 и http://127.0.0.1:80
 
 
### 6. Запускаем скрипт с информацией о системе и пользователе:
	
/vagrant/scripts/get_info.sh
	
	
	
   
