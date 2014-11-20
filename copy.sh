#!/bin/bash

WWW=/var/www
# echo $#
if [ $# -eq 1 ]; then
	WWW=$1
fi
if [[ $1 == beta ]]; then
	WWW=/var/beta
	echo "You choose BETA directory"
elif [[ $1 == osx ]]; then
	WWW=//Library/WebServer/Documents
fi
echo remove  all files to $WWW
sudo rm -rf $WWW/*
echo copy all files to $WWW
sudo cp -a * $WWW
