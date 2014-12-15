#!bootstrap/devsetup/bin/python
import subprocess

def _bootstrap_homebrew():
    subprocess.call(["ruby", "-e", "$(curl -fsSL
     https://raw.github.com/Homebrew/homebrew/go/install)"])

def bootstrap():
    _bootstrap_homebrew()

def Main():
    bootstrap()

if __name__ == "__main__":
    Main()
