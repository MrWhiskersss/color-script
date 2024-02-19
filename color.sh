#!/bin/bash

#  0 for foreground
# 10 for background
mode=0
rest=0.02

if [ $# -gt 1 ]
then
	printf "\033[91merror\033[m: " 1>&2
	printf "unexpected usage - too many arguments\n" 1>&2
	exit 1
fi

case "$1" in
	"")
		;;
	"-h")
		printf "help flag\n"
		# TODO create example usage and flag explanation here
		exit 0
		;;
	"-b")
		mode=10
		;;
	*)
		printf "\033[91merror\033[m: " 1>&2
		printf "unexpected usage - flag $1 not recognized\n" 1>&2
		exit 1
esac

clear
l="\u2500"
b="\u257E"
d="\u257C"
p="\u250C"
q="\u2510"

colr=$(( $mode + 30 ))

printf "\n$p$l$l$d 3 bit / 4 bit $b$l$l$l$l$l$l$l$l$l$l$l$l$q\n"

while [ $colr -le $(( $mode + 37 )) ]
do
	printf " "
	printf "\033[%dm" $colr
	printf "%0*d" 3 $colr
	printf "\033[m"

	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\n"
colr=$(( $mode + 90 ))

while [ $colr -le $(( $mode + 97)) ]
do
	printf " "
	printf "\033[%dm" $colr
	printf "%0*d" 3 $colr
	printf "\033[m"

	colr=$(( $colr + 1 ))
	sleep $rest
done

mode=$(( $mode + 38 ))

printf "\t       ┏┓  ┓     \n"
printf "\t\t\t\t\t       ┃ ┏┓┃┏┓┏┓┏╸\n"
printf "$p$l$l$d 8 bit $b$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$q"
printf "\t       ┗┛┗┛┗┗┛╹╺┛\n"

for swch in {0..7}
do
	printf " "
	printf "\033[%d:5:%dm" $mode $swch
	printf "%0*d" 3 $swch
	printf "\033[m"

	sleep $rest
done

printf "\n"

for swch in {8..15}
do
	printf " "
	printf "\033[%d:5:%dm" $mode $swch
	printf "%0*d" 3 $swch
	printf "\033[m"

	sleep $rest
done

printf "\n\n"

for swch in {16..33} {52..69} {88..105} {124..141} {160..177} {196..213}
do
	printf " "

	if [ $mode -eq 48 ]
	then
		printf "\033[38:5:15m"
	fi

	printf "\033[%d:5:%dm" $mode $swch
	printf "%0*d" 3 $swch
	printf "\033[m"

	if [ $(( ($swch - 15) % 18 )) -eq 0 ]
	then
		printf "\n"
	fi

	sleep $rest
done

printf "\n"

for swch in {34..51} {70..87} {106..123} {142..159} {178..195} {214..231}
do
	printf " "

	if [ $mode -eq 48 ]
	then
		printf "\033[38:5:0m"
	fi
	printf "\033[%d:5:%dm" $mode $swch
	printf "%0*d" 3 $swch
	printf "\033[m"

	if [ $(( ($swch - 15) % 18 )) -eq 0 ]
	then
		printf "\n"
	fi

	sleep $rest
done

printf "\n"

for swch in {232..255}
do
	printf " "
	printf "\033[%d:5:%dm" $mode $swch
	printf "%0*d" 3 $swch
	printf "\033[m"

	if [ $(( ($swch - 15) % 8 )) -eq 0 ]
	then
		printf "\n"
	fi

	sleep $rest
done

printf "\n"
exit 0
