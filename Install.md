### Install scriptt
</details>

## Install Termux
Di Sarankan Menggunakan Termux Terbaru Agar Install Tidak Error Scriptnya.
- Download Termux Terbaru <code><a href="https://f-droid.org/repo/com.termux_1021.apk">klik disini Download</a></code>

Install nya Satu² Perbaris Jangan salin install semua tar error, kalo di bilangin jangan ngeyel
<details open>

```python
cd $HOME
rm -rf Premium-Call
pkg update && pkg upgrade
apt install make clang
apt install wget curl
pkg install python
pkg install python-pip
pkg install tesseract
pkg install git
git clone https://github.com/Dra-Ganzz/Premium-Call
cd Premium-Call
git pull
make install
make run
```
<details open>
  
`bila sudah install semua tinggal jalankan aja`
```bash
cd $HOME
cd Premium-Call
ls
make update
make run
```
