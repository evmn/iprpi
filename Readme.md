# Read IP of Raspberry Pi

## Software Requirement

 - omxplayer
 - ffmpeg

## Code to Read Your Raspberry Pi IP Address

```sh
#/bin/bash
ip=$(hostname -I)

path="/home/pi/iprpi/CN/"
para=${path}"Your_IP_Address_is.mp3"

for((i=0; i<${#ip}-1;i++));
do
	digit=${ip:$i:1}
	if [[ $digit = [.] ]]
	then
		para=${para}"|"${path}"dot.mp3"
	else
		para=${para}"|"${path}${digit}".mp3"
	fi
done
para=${para}"|/home/pi/iprpi/ok.mp3"
ffmpeg -i "concat:$para" -acodec copy ip.mp3 -y
omxplayer ip.mp3
rm ip.mp3
```

## Read Your IP After Boot

Clone this repo to your home directory(`/home/pi/`), run `en.sh` or `cn.sh` to see if you can here your ip address.

If everything is ok. Add a line to `/etc/rc.local`:

>su - pi /home/pi/iprpi/en.sh


## Reference

 - [Sound of Text](https://soundoftext.com/)
 - [github: ncpierson/soundoftext-web](https://github.com/ncpierson/soundoftext-web)
