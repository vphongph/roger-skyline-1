#!/bin/bash

blink="\033[5:m"
blue="\033[38;5;26m"
blue_light="\033[38;5;39m"
purple_dark="\033[38;5;62m"
purple="\033[38;5;98m"
green="\033[38;5;70m"
green_coa="\033[38;5;47m"
green_dark="\033[38;5;28m"
red="\033[38;5;196m"
red_dark="\033[38;5;88m"
grey="\033[38;5;242m"
yellow="\033[38;5;178m"
reset="\033[0m"


SHELL=bash
HOME=/home/vphongph

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

grep -q "alias l='ls -la'" $HOME/.$SHELL"rc"
if [ $? = 1 ]
then
	echo "alias l='ls -la'" >> $HOME/.$SHELL"rc"
fi

grep -q "export LANGUAGE=en_US.UTF-8" $HOME/.$SHELL"rc"
if [ $? = 1 ]
then
	echo "export LANGUAGE=en_US.UTF-8" >> $HOME/.$SHELL"rc"
fi

grep -q "export LANG=en_US.UTF-8" $HOME/.$SHELL"rc"
if [ $? = 1 ]
then
	echo "export LANG=en_US.UTF-8" >> $HOME/.$SHELL"rc"
fi

grep -q "export LC_ALL=en_US.UTF-8" $HOME/.$SHELL"rc"
if [ $? = 1 ]
then
	echo "export LC_ALL=en_US.UTF-8" >> $HOME/.$SHELL"rc"
fi

source $HOME/.$SHELL"rc"
apt-get update -qq
apt-get autoremove -qq
apt-get upgrade -qq
apt-get install vim -qq
