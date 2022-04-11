#!/bin/bash

if [ "$1" == "tihmz" ];then
	git config --global user.email "tthofil@gmail.com"
	git config --global user.name  "Tihmz"

elif [ "$1" == "theo" ];then
	git config --global user.email "theophile.wemaere@gmail.com"
	git config --global user.name "Theophile-Wemaere"
else
	echo "wrong name, choose tihmz or theo"
fi
	
