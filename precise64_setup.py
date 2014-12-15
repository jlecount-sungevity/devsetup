# for use with ubuntu vagrant minion
import subprocess

def _bootstrap_salt():
    subprocess.call(["sudo", "apt-get", "install", "salt"])

def bootstrap():
    _bootstrap_salt()

def Main():
    #bootstrap()
    print "Hello"

if __name__ == "__main__":
    Main()
