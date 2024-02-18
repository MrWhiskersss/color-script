#!/bin/bash

clear
#  0 for foreground
# 10 for background
mode=0
rest=0.02
colr=$(( $mode + 30 ))
l="\u2500"
b="\u257E"
d="\u257C"
p="\u250C"
q="\u2510"

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
colr=0
line=0

printf "\n"
printf "\n$p$l$l$d 8 bit $b$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$q\n"

while [ $colr -le 7 ]
do
	printf " "
	printf "\033[%d:5:%dm" $mode $colr
	printf "%0*d" 3 $colr
	printf "\033[m"

	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\n"

while [ $colr -le 15 ]
do
	printf " "
	printf "\033[%d:5:%dm" $mode $colr
	printf "%0*d" 3 $colr
	printf "\033[m"

	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\n\n"

while [ $colr -le 213 ]
do
	printf " "

	if [ $mode -eq 48 ]
	then
		printf "\033[38:5:15m"
	fi

	printf "\033[%d:5:%dm" $mode $colr
	printf "%0*d" 3 $colr
	printf "\033[m"

	line=$(( ($colr - 15) % 18 ))

	if [ $line -eq 0 ]
	then
		printf "\n"
		colr=$(( $colr + 18 ))
	fi

	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\n"

colr=34

while [ $colr -le 231 ]
do
	printf " "
	printf "\033[%d:5:%dm" $mode $colr
	printf "%0*d" 3 $colr
	printf "\033[m"

	line=$(( ($colr - 15) % 18 ))

	if [ $line -eq 0 ]
	then
		printf "\n"
		colr=$(( $colr + 18 ))
	fi

	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\n"
colr=232

while [ $colr -le 255 ]
do
	printf " "
	printf "\033[%d:5:%dm" $mode $colr
	printf "%0*d" 3 $colr
	printf "\033[m"

	line=$(( ($colr - 15) % 8 ))

	if [ $line -eq 0 ]
	then
		printf "\n"
	fi

	colr=$(( $colr + 1 ))
	sleep $rest
done

printf "\n\n"
