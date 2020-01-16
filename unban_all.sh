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


function unban_all {


	sudo iptables -L INPUT -v -n

	sudo iptables -D INPUT -s 10.11.4.13 -j DROP

	sudo iptables -D INPUT 1

	sudo vim /etc/hosts.deny

	sudo ip route

	sudo ip route del 10.11.4.13

	# sudo ufw status numbered

	# sudo ufw delete 1

	sudo fail2ban-client set recidive unbanip 10.11.4.13



	sudo fail2ban-client set apache-dos unbanip 10.11.4.13

	sudo fail2ban-client set recidive unbanip 10.11.4.13

}

unban_all

ab -n 1000 -c 20 http://10.11.88.88/
slowloris 10.11.88.88 -s 500 --sleeptime 3