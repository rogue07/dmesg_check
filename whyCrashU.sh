#!/bin/bash

# ram
# rpersaud@tdsclinical.com
# ver=0.1

# jul 5, 2020 / 20:25
# check kdump, dmesg and last

while true; do
	clear
	echo
	echo "##################"
	echo "# Crash Analysis #"
	echo "##################"
	echo
        echo "k. Check kdump: "	
	echo "w. Check dmesg WARN: "
	echo "c. Check dmesg CRITICAL: "
	echo "a. Check dmesg ALERT: "
	echo "e. Check dmesg EMERGENCY: "
	echo "s. Check last SHUTDOWN/REBOOT: "
	echo "q. Quit"
	echo
	echo
	echo -n "Please make a choice: "
	read CHOICE
	echo


case $CHOICE in
	"k" | "K")
		clear
		echo
		find /var/crash -type f -mtime -1
		sleep 5
		;;
	"w" | "W")
		clear
                echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T -l warn | less
		;;
	"c" | "C")
		clear
		echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T -l crit | less
		;;
	"a" | "A")
		clear
		echo "Press space bar to see more. Press q to quit."
		sleep 3
		dmesg -T -l alert | less
		;;
	"e" | "E")
		clear
		echo "Press space bar to see more. Press q to quit."
		sleep 3
		dmesg -T -l emerg | less
		;;
	"s" | "S")
		clear
		echo "If you see 2 reboots in a row then it was a CRASH."
		clear
		last -n5 x shutdown reboot
		echo
		echo -n "Press q to quit: "
		read $quit
		;;
	"q" | "Q")
		break
		;;
		*)
		echo "Invalid choice"
		clear
		;;
esac


done
