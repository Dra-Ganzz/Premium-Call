PYTHON_VERSION := $(shell python -V | sed 's/[[:space:]]//g' | cut -c 1-10 | tr '[:upper:]' '[:lower:]')

install:
	apt-get update
	apt-get upgrade
	apt-get install ruby python ossp-uuid figlet pv toilet nodejs openssl-tool file silversearcher-ag zsh -y
	apt-get install curl xh ncurses-utils tree jq clang bc nodejs-lts xz-utils nala ripgrep binutils gum pv mpv -y
	rm -rf $$PREFIX/lib/$(PYTHON_VERSION)/site-packages/requests
	pip uninstall requests -y
	pip uninstall urllib3 -y
	pip uninstall bs4 -y
	pip install httpie
	pip install -r Data/requirements.txt
	@gem install lolcat
	@npm -g i chalk chalk-animation
	@printf "\n\n\033[37m[\033[33m*\033[37m] Packet module berhasil diinstall \033[31m.."
	@printf "\n\033[37m[\033[31m!\033[37m] Jalankan script dg ketik \033[1;30m'\033[0m\033[32mpython3 apps.py\033[1;30m' \033[0m\033[37matau \033[1;30m'\033[0m\033[32mmake run\033[1;30m'\n\n"

update:
	pip install -r Data/requirements.txt

run:
	@git pull
	@echo "[+] Lagi Di Run Sabar Ya"

	@echo "[+] Cek Python..."
	@python3 -V > /dev/null 2>&1 || ( \
		echo "[!] Python error / tidak ada → reinstall total..." && \
		pkg uninstall python -y || true && \
		pkg install python -y \
	)

	@echo "[+] Cek pip..."
	@python3 -m pip --version > /dev/null 2>&1 || ( \
		echo "[!] Pip rusak → reinstall python ulang..." && \
		pkg uninstall python -y || true && \
		pkg install python -y \
	)

	@echo "[+] Install ulang requirements..."
	@python3 -m pip install --upgrade pip
	@python3 -m pip install -r Data/requirements.txt || ( \
		echo "[!] Gagal install module → reinstall python lagi..." && \
		pkg uninstall python -y || true && \
		pkg install python -y && \
		python3 -m pip install --upgrade pip && \
		python3 -m pip install -r Data/requirements.txt \
	)

	@echo "[+] Lagi Di Run Sabar Ya..."
	@python3 apps.py
