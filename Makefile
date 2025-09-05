PYTHON_VERSION := $(shell python -V | sed 's/[[:space:]]//g' | cut -c 1-10 | tr '[:upper:]' '[:lower:]')

install:
	apt-get update
	apt-get upgrade
	apt-get install ruby python ossp-uuid figlet pv toilet nodejs openssl-tool file silversearcher-ag zsh -y
	apt-get install curl xh ncurses-utils tree jq clang bc nodejs-lts xz-utils nala ripgrep binutils gum pv -y
	rm -rf $$PREFIX/lib/$(PYTHON_VERSION)/site-packages/requests
	pip uninstall requests -y
	pip uninstall urllib3 -y
	pip uninstall bs4 -y
	pip install httpie
	pip install -r Data/requirements.txt
	@gem install lolcat
	@npm -g i chalk chalk-animation
	@echo "[+] paket berhasil di setup Jalankan make run | python3 apps.py"

update:
	pip install -r Data/requirements.txt

run:
	@git pull
	@echo "[+] Lagi Di Run Sabar Ya"
	@python3 apps.py
