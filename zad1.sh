#!/bin/sh

PARAM="enp0s3"

while true; do
  LINE=$(grep $PARAM /proc/net/dev | sed s/.*://)
  RECEIVED1=$(echo $LINE | awk '{print $1}')
  TRANSMITTED1=$(echo $LINE | awk '{print $9}')
  sleep 1
  LINE=$(grep $PARAM /proc/net/dev | sed s/.*://)
  RECEIVED2=$(echo $LINE | awk '{print $1}')
  TRANSMITTED2=$(echo $LINE | awk '{print $9}')
  SPEED=$(($RECEIVED2+$TRANSMITTED2-$RECEIVED1-$TRANSMITTED1))

  LICZNIK=$(($LICZNIK + 1))
  SUMA=$(($SUMA + $SPEED / 1024))
  SREDNIA=$(($SUMA / $LICZNIK))
  printf "Aktualna predkosc: %4i KB/s | Srednia: %4i KB/s\n" $(($SPEED/1024)) $(($SREDNIA));
	

	export `cat /sys/class/power_supply/BAT0/uevent`
	echo "Naładowanie baterii:  $POWER_SUPPLY_CAPACITY  %"
	
	SEK=$(cat /proc/uptime | awk '{ print $1 }')
	SEK=$(printf '%.0f' $(echo $SEK | tr . ,) 2>/dev/null )
	printf "System włączony  %i sekund = %i minut = %i godzin\n" $(($SEK)) $(($SEK/60)) $(($SEK/3600))
	
	ZMIENNA=$(cat /proc/loadavg | awk '{ print $3 }')	
	echo "Obciazenie systemu: $ZMIENNA"
	echo "************************"
done;
