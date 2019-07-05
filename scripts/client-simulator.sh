#!/bin/bash

[ $1 ] && [ $2 ] && [ $3 ] || { echo "Usage: $0 <qrcode.png> <nome> <email>"; exit; }

IMG=$1
NAME=$2
EMAIL=$3

for CMD in zbarimg
do
    if [ ! `which $CMD` ]
    then
        echo "[ERROR] Missing command/app \"$CMD\". Install it first."
		echo "[TIP] try: sudo apt install $CMD -y"
        exit
    fi
done

INFO=$(zbarimg $IMG)
#echo "Info:  $INFO"
QR=$(echo $INFO | cut -d":" -f2,3)
URL=$(echo $QR | cut -d"&" -f1)
MESSAGE=$(echo $QR | cut -d"&" -f2)

curl -d "nome=$NAME&email=$EMAIL&code=$MESSAGE" -X POST $URL > /dev/null
