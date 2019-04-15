#!/bin/bash

while true;

do
	ZMIENNA1=$(lynx -dump $1)	
	sleep $2
	ZMIENNA2=$(lynx -dump $1)	

	echo $ZMIENNA1 > plik1
	echo $ZMIENNA2 > plik2

	WARUNEK=$(diff -q plik1 plik2)

	if [ "$WARUNEK" ] 
	then
		echo "ZMIANA!!!"
	else
		echo "To samo"
	fi

done
