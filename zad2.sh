#!/bin/bash

for nazwa in *
do
	if [[ ${nazwa} =~ ^[0-9]+$ ]];
	#if echo "$nazwa" | grep -qE '^[0-9]+$';
	then
	ZMIENNA1=$(cat /proc/$nazwa/status | grep -w Pid | awk '{ print $1 $2}')	

ZMIENNA2=$(cat /proc/$nazwa/status | grep -w Name | awk '{ print $1 $2}')	

	ZMIENNA3=$(cat /proc/$nazwa/status | grep -w State | awk '{ print $1 $2}')

	ZMIENNA4=$(ls /proc/$nazwa/fd 2>/dev/null | wc -l | awk '{ print $1 }')

	printf "%10s |  %20s | %8s  | Open files: %4s\n" "$ZMIENNA1" "$ZMIENNA2" "$ZMIENNA3" "$ZMIENNA4";

	fi;

done;
