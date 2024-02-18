#!/bin/bash

clear

#  0 for foreground
# 10 for background
mode=0
rest=0.02

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

printf "\n"
printf "\n$p$l$l$d 8 bit $b$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$l$q\n"

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
