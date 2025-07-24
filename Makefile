install:
	apt-get update
	apt-get upgrade
	apt-get install ruby python ossp-uuid figlet pv toilet nodejs openssl-tool file silversearcher-ag zsh -y
	apt-get install curl xh ncurses-utils tree jq clang bc nodejs-lts xz-utils nala ripgrep binutils gum pv -y
	pip install -r Data/requirements.txt
	pip uninstall urllib3 -y
	pip install urllib3
	pip install httpie
	pip install phonenumbers
	@gem install lolcat
	@npm -g i chalk chalk-animation
	@echo "[+] paket berhasil di setup Jalankan make run | bash apps.sh"

update:
	pip install -r Data/requirements.txt

run:
	@echo "[+] Lagi Di Run Sabar"
	@bash apps.sh
