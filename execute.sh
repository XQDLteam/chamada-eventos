#!/bin/bash

[ $1 ] || { echo "Usage: $0 <key>"; exit; }

KEY=$1

for CMD in qrencode sqlite3 zbarimg xterm virtualenv curl

do
    if [ ! `which $CMD` ]
    then
        echo "[ERROR] Missing command/app \"$CMD\". Install it first."
		echo "[TIP] try: sudo apt install $CMD -y"
        exit
    fi
done
echo -n "Creating a virtual enviroment.."
virtualenv -p python3 flask
source flask/bin/activate
echo "Done!!"
cd scripts/
echo "Stalling python dependences..."
pip3 install -r requirements.txt #&>/dev/null
echo "Done!"
echo -n "Creating database... "
bash create-db.sh
echo "database.sb Done!"
echo -n "Adding fake events... "
bash init-events.sh eventos.csv $KEY
echo "Done!"
echo -n "Starting server..."
xterm -hold -e "source flask/bin/activate ; python3 ../server/app.py" & 
sleep 3
echo "On air! Now u can test with scripts/client-simulator.sh"
