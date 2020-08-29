#!/bin/bash
# This program designed and developed by Mohsen Jalayeri in linux bash

# Define alphabet
alphabet=( {a..z} )

# get number for shift
getshift() {
printf "=============================================\n"
while true
	do
		printf "Please insert number between -25 to 25 for shift: "
		read shift

		if [[ "$shift" =~ ^[-+]?([1-9][[:digit:]]*|0)$ ]] && [[ $shift -ge -25 ]] && [[ $shift -le 25 ]]
			then
			if [[ $eord = 'd' ]] || [[ $eord = 'D' ]]
				then	
				shift=$(($shift * -1))
			fi
			newalpha
			break
		else
			echo "Error, please insert number only and between -25 to 25"
		fi
done
}

# Shift Alphabet
newalpha()
{

for key in "${!alphabet[@]}"; do 
	temp=$key

	if [[ $(($temp + $shift)) -gt 25 ]]
		then
		temp=$(($temp - 26))
	elif [[ $(($temp + $shift)) -lt 0 ]]
		then
		temp=$(($temp + 26))
	fi
	newalphabet[$temp + $shift]=${alphabet[$key]}
done

}

# Get text from user
gettext() {
printf "===================\n"
printf "Please insert text: "
read text
printf "===================\n"
printf "converted text is: "

for (( i=0; i<${#text}; i++ )); do
	
	for index in "${!alphabet[@]}"; do 
		if [[ "${text:$i:1}"  == ${alphabet[$index]} ]]
		then
		printf "%s" ${newalphabet[$index]}
		elif [[ "${text:$i:1}"  == ' ' ]] 
		then
		printf " "
		break
		fi
	done

done

printf "\n"
}

# Start Program
while true
	do
		eord=''
		while true
			do
				printf "*************************************************\n"
				printf "Please press 'e' for encript or 'd' for decript: "
				read -n 1 eord
				printf "\n"
				if [[ $eord = 'e' ]] || [[ $eord = 'E' ]] || [[ $eord = 'd' ]] || [[ $eord = 'D' ]]
					then	
						getshift
						gettext
						break
				else
					echo "Error, please insert e or d "
				fi

		done
done

