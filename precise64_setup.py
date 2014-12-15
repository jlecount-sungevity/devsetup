# for use with ubuntu vagrant minion
import subprocess

def _bootstrap_salt():
    subprocess.call(["mkdir", "/srv"])
    subprocess.call(["cp", "bootstrap/files/srv/*", "/srv/"])

def bootstrap():
    _bootstrap_salt()

def Main():
    bootstrap()

if __name__ == "__main__":
    Main()
