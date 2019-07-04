#!/bin/bash 

if [ $# -lt 1 ]; then
	echo "Faltam argumentos!"
	echo "Use: ./script <arquivo.csv>"
	exit 1
fi

input="$*"

while IFS=';' read -r line
do
	IFS=';' read -ra INFO <<< "$line"

	chave=`echo -n "$line" | openssl sha1 -hmac 'key'`
	IFS=' ' read -ra chave <<< "$chave"
	
	sqlite eventos_db "insert into eventos(codigo, nome, data, hora_inicio, hora_fim, observacoes) values ('${chave[1]}', '${INFO[0]}', '${INFO[1]}', ${INFO[2]}, ${INFO[3]}, '${INFO[4]}');"

	qrencode -o "${INFO[0]}.png" "127.0.0.1:5000-${chave[1]}"
	
done < "$input"


