#!/bin/bash 

if [ $# -lt 2 ]; then
	echo "Faltam argumentos!"
	echo "Use: $0 <dados_evento.csv> <chave>"
	exit 1
fi

input="$1"

while IFS=';' read -r LINE
do
	IFS=';' read -ra INFO <<< "$LINE"

	CHAVE=`echo -n "$LINE" | openssl sha1 -hmac $2`
	IFS=' ' read -ra CHAVE <<< "$CHAVE"
	sqlite3 ../server/database.db "INSERT INTO eventos(codigo, nome, data, hora_inicio, hora_fim, obs) values ('${CHAVE[1]}', '${INFO[0]}', '${INFO[1]}', ${INFO[2]}, ${INFO[3]}, '${INFO[4]}');"

	qrencode -o "${INFO[0]}.png" "127.0.0.1:5000&${CHAVE[1]}"

done < "$input"
