def check_update_requests():
    import sys
    import subprocess
    import json
    from urllib.request import urlopen

    try:
        import requests
        local_version = requests.__version__
    except:
        local_version = None

    try:
        with urlopen("https://pypi.org/pypi/requests/json", timeout=10) as res:
            data = json.loads(res.read().decode())
            latest_version = data["info"]["version"]
    except Exception as e:
        print("[!] Gagal ambil versi:", e)
        return


    if local_version != latest_version:
        print("[!] Update requests...")
        subprocess.call([sys.executable, "-m", "pip", "uninstall", "-y", "requests"])
        subprocess.call([sys.executable, "-m", "pip", "install", "--upgrade", "requests"])
    else:
        print("[+] Sudah terbaru ✔")

if __name__ == "__main__":
    check_update_requests()
