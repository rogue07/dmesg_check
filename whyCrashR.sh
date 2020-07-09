#!/bin/bash

# ram
# ver=0.1

# jul 5, 2020 / 20:25
# check kdump, dmesg and last

while true; do
	clear
	echo
	echo "####################"
	echo "# Why did I crash? #"
	echo "####################"
	echo
        echo "k. Check kdump: "	
	echo "e. Check dmesg EMERGENCY: "
	echo "a. Check dmesg ALERT: "
	echo "c. Check dmesg CRITICAL: "
	echo "w. Check dmesg WARN: "
	echo "n. Check dmesg NOTICE: "
	echo "i. Check dmesg INFO: "
	echo "d. Check demeg DEBUG-LEVEL MESSAGES: "
	echo "q. Quit"
	echo
	echo
	echo -n "Please make a choice: "
	read CHOICE
	echo


case $CHOICE in
	"v" | "V")
		clear
		echo
		find /var/crash -type f -mtime -1
		sleep 5
		;;
	"e" | "E")
		clear
                echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T --level=emerg | less
		;;
	"a" | "A")
		clear
		echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T --level=alert | less
		;;
	"c" | "C")
		clear
		echo "Press space bar to see more. Press q to quit."
		sleep 3
		dmesg -T --level=crit | less
		;;
	"e" | "E")
		clear
		echo "Press space bar to see more. Press q to quit."
		sleep 3
		dmesg -T --level=err | less
		;;
	"w" | "W")
                clear
                echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T --level=warn | less
                ;;
        "n" | "N")
                clear
                echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T --level=notice | less
                ;;
        "i" | "I")
                clear
                echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T --level=info | less
                ;;
        "d" | "D")
                clear
                echo "Press space bar to see more. Press q to quit."
                sleep 3
                dmesg -T --level=debug | less
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
