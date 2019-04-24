# IP of Raspberry Pi

`iprpi` stands for **IP** of **R**aspberry **Pi**

## Software/Hardware Requirement

 - omxplayer
 - ffmpeg

Install with the following command:

```sh
sudo apt update
sudo apt install omxplayer ffmpeg
```

 - Raspberry Pi
 - 3.5mm Headphones / Speakers


## Code to Read Your Raspberry Pi IP Address

```sh
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
```

## Read Your IP After Boot

Clone this repo to your home directory(`/home/pi/`), run `en.sh` or `cn.sh` to see if you can hear your ip address.

If everything is ok. Add a line to `/etc/rc.local`:

>su - pi /home/pi/iprpi/en.sh

Reboot your Pi, you will hear your IP.

## Reference

 - [Sound of Text](https://soundoftext.com/)
 - [github: ncpierson/soundoftext-web](https://github.com/ncpierson/soundoftext-web)
