#!/bin/bash

# stop on failed command
set -e

GITURL=https://github.com/saltstack/salt
PIP=/usr/local/bin/pip

usage()
{
    cat <<  EOF
usage: $0 OPTIONS

This script to setup salt master / minion in osx.

OPTIONS:
   -h      This help
   -M      Install the master
   -S      Install the syndicate
   -N      DO NOT install the minion
   -U      DO NOT upgrade repositories first (doesn't work)
EOF
}

MASTER=
SYNDICATE=
MINION=1
UPGRADE=1
VERSION=stable
GITREF=develop
while getopts “hMSNU” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         M)
             MASTER=1
             shift
             ;;
         S)
             SYNDICATE=1
             shift
             ;;
         N)
             MINION=
             shift
             ;;
         U)
             UPGRADE=
             shift
             ;;
         ?)
             usage
             exit
             ;;
     esac
done
if [ "$1" ]; then
    VERSION=$1
    shift
fi
if [ "$VERSION" == "git" ]; then
    GITREF=$1
    shift
fi

function install_cltools {
    hdiutil mount './commandlinetoolsosx10.10forxcode6.1.1.dmg'
    volume="/Volumes/Command Line Developer Tools"
    installer -pkg "$volume/Command Line Tools (OS X 10.10).pkg" -target /
    hdiutil detach "$volume"
}

function install_homebrew {
    rm -rf /tmp/homebrew
    git clone https://github.com/mxcl/homebrew /tmp/homebrew
    rsync -axSH /tmp/homebrew/ /usr/local/
    (
        cd /usr/local/
        git clean -fd
    )
    chmod -R 777 /usr/local/
    chown -R root /usr/local/
    chgrp -R staff /usr/local/
}

function install_dependencies {
    # salt requires these directories... not sure why
    mkdir -p /var/cache/salt/master; true
    mkdir -p /var/cache/salt/minion; true

    BREW=/usr/local/bin/brew
    $BREW install swig
    $BREW install zmq
    $BREW install python
}

function setup_salt {
    if [ "$VERSION" == "stable" ]; then
        $PIP install salt
    elif [ "$VERSION" == "develop"]; then
        $PIP install "git+${GITURL}@develop#egg=salt"
    elif [ "$GITREF" ]; then
        $PIP install "git+${GITURL}@${GITREF}#egg=salt"
    fi

    # increase max file descriptor limit
    launchctl limit maxfiles 10000

    export PATH=$PATH:/usr/local/share/python/ > ~/.bash_profile
}


function main {
    install_cltools
    install_homebrew
    install_dependencies
    setup_salt
}

main
