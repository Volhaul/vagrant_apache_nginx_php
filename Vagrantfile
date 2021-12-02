# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.provider "virtualbox" do |vb|
		vb.gui = false
		vb.memory = "2048"
		vb.cpus = 2
		vb.name = "apache_nginx"
	end
	
	# Импорт образа Debian 9 (берем версию где вирт. диск 10G как в ТЗ, более поздние уже 20G)
	config.vm.box_version = "9.9.0"
	config.vm.box = "debian/stretch64"

	# Обновления нам пока не нужны
	config.vm.box_check_update = false

	# Для целей тестирования пробрасываем на все интерфейсы хост-машины на соответствующие порты
	config.vm.network "forwarded_port", guest: 80, host: 80
	# config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.network "forwarded_port", guest: 8888, host: 8888

	# Домашний каталог проекта и так монтируется по умолчанию в /vagrant, но хуже не будет
	config.vm.synced_folder ".", "/vagrant"

	# запускаем скрипт установки и настройки необходимых пакетов  (перезапуск делаем так: vagrant reload --provision)
	config.vm.provision :shell, path: "essentials.sh", run: "always"
end
