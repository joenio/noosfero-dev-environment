#!/bin/sh

if [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
  OS=$DISTRIB_ID
elif [ -f /etc/debian_version ]; then
  OS=Debian
elif [ -f /etc/arch-release ]; then
  OS=Arch
elif [ -f /etc/SuSE-release ]; then
  OS=Suse
else
  OS=$(uname -s)
fi

if [ -x ./development-setup/$OS.sh ]; then
  ./development-setup/$OS.sh
  ./holodev setup
else
  echo "W: ./development-setup/$OS.sh not found, aborting setup for holodev!"
  echo "W: You need to install the development dependencies by hand."
fi
