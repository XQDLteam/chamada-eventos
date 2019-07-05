#!/bin/bash 

if [ $# -lt 2 ]; then
	echo "Faltam argumentos!"
	echo "Use: $0 <dados_evento.csv> <chave>"
	exit 1
fi

input="$1"

while SPLITTER=';' read -r LINE
do
	SPLITTER=';' read -ra INFO <<< "$LINE"

	CHAVE=`echo -n "$line" | openssl sha1 -hmac $2`
	SPLITTER=' ' read -ra CHAVE <<< "$CHAVE"

	sqlite eventos_db "insert into eventos(codigo, nome, data, hora_inicio, hora_fim, observacoes) values ('${chave[1]}', '${INFO[0]}', '${INFO[1]}', ${INFO[2]}, ${INFO[3]}, '${INFO[4]}');"

	qrencode -o "${INFO[0]}.png" "127.0.0.1:5000-${chave[1]}"

done < "$input"
