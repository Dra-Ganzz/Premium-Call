import os
import sys
import tty
import time
import termios
import shutil
import subprocess
import atexit
import signal

MIN_COLS = 64

a = "\033[1;30m"
m = "\033[1;31m"
h = "\033[1;32m"
k = "\033[1;33m"
c = "\033[1;36m"
p = "\033[1;37m"
r = "\033[0m"

fd = sys.stdin.fileno()
old_settings = termios.tcgetattr(fd)


def hide_cursor():
    sys.stdout.write("\033[?25l")
    sys.stdout.flush()


def show_cursor():
    sys.stdout.write("\033[?25h")
    sys.stdout.flush()


def restore_terminal():
    try:
        termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
    except Exception:
        pass


def cleanup():
    restore_terminal()
    show_cursor()


def signal_handler(signum, frame):
    cleanup()
    raise SystemExit(0)


atexit.register(cleanup)
signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)


def auto_update():
    try:
        with open(os.devnull, "w") as devnull:
            result = subprocess.run(
                ["git", "remote", "-v"],
                stdout=subprocess.PIPE,
                stderr=devnull,
                text=True,
            )

            if result.stdout.strip():
                subprocess.run(
                    ["git", "pull"],
                    stdout=devnull,
                    stderr=devnull,
                    check=False,
                )
    except Exception:
        pass


auto_update()
try:
    tty.setcbreak(fd)
    hide_cursor()

    last_status = None

    while True:
        cols = shutil.get_terminal_size().columns

        if cols >= MIN_COLS:
            status = (
                "OK",
                f"""
\033[102m   {r} {p}Ukuran Layar {h}Sudah{p} Sesuai."""
            )
        else:
            status = (
                "SMALL",
                f""" Tidak Mengerti Bisa Chat 0895404759092
\033[101m   {r} {p}Ukuran Layar {m}Belum{p} Sesuai.
{p}Silahkan Cubit Layar"""
            )

        if status != last_status:
            print("\033[2J\033[H", end="", flush=True)
            print(status[1], end="", flush=True)
            last_status = status

        if cols >= MIN_COLS:
            time.sleep(1)

            cleanup()

            print("\033[2J\033[H", end="", flush=True)

            try:
                subprocess.run(
                    [sys.executable, "apps.py"],
                    stdin=sys.stdin,
                    stdout=sys.stdout,
                    stderr=sys.stderr,
                )
            finally:
                cleanup()

            break

        time.sleep(0.05)

except KeyboardInterrupt:
    pass

finally:
    cleanup()
