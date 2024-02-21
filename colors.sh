#!/bin/bash

FORE=0
BACK=10

print4bit()
{
	BLCK=30
	WHTE=97
	text=$2

	if [ $1 -eq $BACK ]; then
		if [ $2 -le 47 ]; then
			text=$WHTE
		else
			text=$BLCK
		fi
	fi

	printf " "
	printf "\033[%dm" $2
	printf "\033[%dm" $text
	printf "%0*d" 3 $2
	printf "\033[m"
}

print8bit()
{
	BLCK=0
	WHTE=15
	text=$2

	printf " "

	if [ $1 -eq $BACK ]; then
		printf "\033[48:5:%dm" $2

		if [ "$3" = true  ]; then
			text=$WHTE
		else
			text=$BLCK
		fi
	fi

	printf "\033[38:5:%dm" $text
	printf "%0*d" 3 $2
	printf "\033[m"
}

showHelp()
{
	printf "
	NAME\n
	\tcolors - display the terminals 4 bit and 8 bit colors\n
	SYNOPSIS\n
	\tcolors [SHORT-OPTION]...\n
	DESCIRPTION\n
	\t-h\tshow this help text\n
	\t-b\tshow colors as background colors\n
	\t-f\tshow colors as foreground colors (default)\n
	\t-i\tprint all colors instantly instead of \"water-falling\"\n
	AUTHOR\n
	\tWritten by Ethan Hammons\n"
}

mode=$FORE
rest=0.01

if [ $# -gt 1 ]; then
	printf "\033[91merror\033[m: " 1>&2
	printf "unexpected usage - too many arguments\n" 1>&2
	exit 1
fi

case "$1" in
	"")
		;;
	"-h")
		showHelp
		exit 0
		;;
	"-b")
		mode=10
		;;
	"-f")
		mode=0
		;;
	*)
		printf "\033[91merror\033[m: " 1>&2
		printf "unexpected usage - flag $1 not recognized\n" 1>&2
		exit 1
esac

clear
colr=$(( $mode + 30 ))

printf "┌──╼ 3 bit / 4 bit ╾────────────┐\n"

while [ $colr -le $(( $mode + 37 )) ]; do
	print4bit $mode $colr
	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\n"
colr=$(( $mode + 90 ))

while [ $colr -le $(( $mode + 97)) ]; do
	print4bit $mode $colr
	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\t       ┏┓  ┓     \n"
printf "\t\t\t\t\t       ┃ ┏┓┃┏┓┏┓┏╸\n"
printf "┌──╼ 8 bit ╾────────────────────┐"
printf "\t       ┗┛┗┛┗┗┛╹╺┛\n"

for swch in {0..7}
do
	print8bit $mode $swch true
	sleep $rest
done

printf "\n"

for swch in {8..15}
do
	print8bit $mode $swch false
	sleep $rest
done

printf "\n\n"

for swch in {16..33} {52..69} {88..105} {124..141} {160..177} {196..213}
do
	print8bit $mode $swch true

	if [ $(( ($swch - 15) % 18 )) -eq 0 ]; then
		printf "\n"
	fi

	sleep $rest
done

printf "\n"

for swch in {34..51} {70..87} {106..123} {142..159} {178..195} {214..231}
do
	print8bit $mode $swch false

	if [ $(( ($swch - 15) % 18 )) -eq 0 ]; then
		printf "\n"
	fi

	sleep $rest
done

printf "\n"

for swch in {232..239}
do
	print8bit $mode $swch true

	if [ $(( ($swch - 15) % 8 )) -eq 0 ]; then
		printf "\n"
	fi

	sleep $rest
done

for swch in {240..255}
do
	print8bit $mode $swch false

	if [ $(( ($swch - 15) % 8 )) -eq 0 ]; then
		printf "\n"
	fi

	sleep $rest
done

printf "\n"
exit 0
