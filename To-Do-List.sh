#!/bin/bash

clear

#Variables
QUIT=0

#Makes sure user has tasks.txt, an essential file for the program.
TASKS=~/Programs/BASH/To-Do-List/tasks.txt
if test -f "$TASKS"; then
	echo ""
else
	echo "tasks.txt not found! Creating tasks.txt..."
	touch tasks.txt
	echo "Created tasks.txt in current directory!"
fi

#actual to do list 
while [ $QUIT -eq 0 ]; do 
	echo "Your current to-do list:"
	cat -n tasks.txt

	echo "------------------------"
	echo "Would you like to [a]dd a new entry, [d]elete an old one, or [q]uit the program? (a/d/q)"
	read LETTER
	case $LETTER in
		a|1)
			echo "Please add an entry to the list:"
			read ENTRY
			echo "$ENTRY" >> tasks.txt
			echo "Added '$ENTRY' to the list."
			clear
			echo "------------------------"
			;;
		d|2)
			echo "Which line would you like to delete? (Enter a number):"
			read DELETE
			sed -i "${DELETE}d" tasks.txt
			echo "Deleted line $DELETE."
			clear
			echo "------------------------"
			;;
		q|3)
			QUIT=1
			clear
			;;
	esac
done
