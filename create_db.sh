#!/bin/bash

sed 's/^//' <<CHAR_EOF> database.sql
CREATE TABLE IF NOT EXISTS eventos(
    codigo text PRIMARY KEY,
    nome text,
    local text,
    data text, 
    hora_inicio text,
    hora_fim text,
    obs text
);

CREATE TABLE IF NOT EXISTS presencas(
   codigo_evento text,
   nome text,
   email text UNIQUE,
FOREIGN KEY (codigo_evento) REFERENCES eventos(codigo)
)

CHAR_EOF

sqlite3 database.db < database.sql
