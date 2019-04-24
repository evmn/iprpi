#/bin/bash
ip=$(hostname -I | sed 's/ //g')	# Delete space byte

path="/home/pi/iprpi/EN/"
para="${path}Your_IP_Address_is.mp3"

PiIP="$path${ip}.mp3"

if test -f "$PiIP";then
	omxplayer $PiIP
else
	for((i=0; i<${#ip};i++));
	do
		digit=${ip:$i:1}
		para="$para|$path${digit}.mp3"
	done
	para="$para|${path}ok.mp3"
	ffmpeg -i "concat:$para" -acodec copy $PiIP
	omxplayer $PiIP
fi
