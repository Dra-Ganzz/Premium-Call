# Deteksi OS
OS := $(shell uname -o)

# Target utama: Install dependencies
install:
	@git pull
	@clear
ifeq ($(OS), GNU/Linux)
	@echo "Menggunakan APT untuk Ubuntu/WSL..."
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get install -y ruby python3 python3-pip nodejs npm figlet pv toilet \
		curl wget jq xz-utils clang libncurses5-dev libjpeg-dev libpng-dev libtiff-dev libfreetype6-dev \
		uuid-dev libssl-dev nano ffmpeg
	pip3 install --break-system-packages -r Data/requirements.txt
	sudo npm install -g bash-obfuscate
	sudo gem install lolcat
endif

ifeq ($(OS), Android)
	@echo "Menggunakan pkg untuk Termux..."
	apt-get update
	apt-get upgrade
	apt-get install ruby python ossp-uuid figlet pv toilet nodejs uuid-utils
	apt-get install curl xh ncurses-utils clang bc nodejs-lts ossp-uuid xz-utils
	apt-get install bash curl wget jq ffmpeg
	apt-get install nodejs-lts python
	apt-get install libjpeg-turbo libpng libtiff freetype -y
	apt-get install python python-pip nano
	apt-get install clang ncurses-utils xh
	apt-get install ossp-uuid openssl openssl-tool
	python -m pip install -r Data/requirements.txt
	@npm -g i bash-obfuscate
	@gem install lolcat
endif

ifeq ($(OS), Darwin)
	@echo "Menggunakan Homebrew untuk macOS..."
	brew install ruby python3 node figlet pv toilet curl wget jq xz clang nano ffmpeg
	pip3 install -r Data/requirements.txt
	npm install -g bash-obfuscate
	gem install lolcat
endif

ifeq ($(OS), Msys)
	@echo "Menggunakan Pacman untuk Windows (MSYS2)..."
	pacman -Syu --noconfirm
	pacman -S --noconfirm ruby python python-pip nodejs npm figlet pv toilet curl \
		wget jq xz clang nano ffmpeg
	python -m pip install -r Data/requirements.txt
	npm install -g bash-obfuscate
	gem install lolcat
endif

	@clear
	@printf "\n\033[37m[\033[33m*\033[37m] Package & module berhasil diinstall \033[31m..\n"
	@printf "\n\033[37m[\033[31m!\033[37m] Run script dg ketik \033[1;30m'\033[0m\033[32mmake run\033[1;30m' \033[0m\033[37matau \033[1;30m'\033[0m\033[32mmake run\033[1;30m'\n\n"

update:
ifeq ($(OS), GNU/Linux)
	pip3 install --break-system-packages -r Data/requirements.txt
endif

ifeq ($(OS), Android)
	python -m pip install -r Data/requirements.txt
endif
	@clear
	@printf "\n\033[37m[\033[33m*\033[37m] module berhasil diupdate \033[31m..\n"
	@printf "\n\033[37m[\033[31m!\033[37m] Run script dg ketik \033[1;30m'\033[0m\033[32mmake run\033[1;30m' \033[0m\033[37matau \033[1;30m'\033[0m\033[32mmake run\033[1;30m'\n\n"

run:
	@git pull
	@node encc.py

reset:
	@rm -f encc.py
