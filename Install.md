### Install acript
</details>

## Install Termux
Mungkin Dari kalian Ada yang belum install termux jadi saya sediakan termux terbaru
- Download Termux Terbaru <code><a href="https://f-droid.org/repo/com.termux_1021.apk">klik disini Download</a></code>

Install nya Satu² Perbaris Jangan salin install semua tar error, kalo di bilangin jangan ngeyel
<details open>

```php
cd $HOME
pkg update && pkg upgrade
apt install make clang
apt install wget curl
pkg install python
pkg install python-pip
pkg install tesseract
pkg install git
git clone https://github.com/Dra-Ganzz/Premium-Call
cd Premium-Call
pip install psutil
git pull
make install
make run
```
<details open>
  
`bila sudah install semua tinggal jalankan aja`
```bash
cd Premium-Call
ls
make update
make run
```
