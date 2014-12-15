# for use with ubuntu vagrant minion
import subprocess

def _bootstrap_salt():
    subprocess.call(["curl", "-L", 
    "https://bootstrap.saltstack.com", "|", "sudo", "sh",
    "-s", "--", "git", "develop"])
    subprocess.call(["mkdir", "/srv"])
    subprocess.call(["cp", "bootstrap/files/srv/*", "/srv/"])

def _highstate():
    subprocess.call(["salt-call", "--local", "state.highstate"])

def bootstrap():
    _bootstrap_salt()

def Main():
    bootstrap()

if __name__ == "__main__":
    Main()
