CREATE TABLE IF NOT EXISTS eventos(
    codigo text PRIMARY KEY,
    nome text,
    local text,
    data text, 
    hora text
);

CREATE TABLE IF NOT EXISTS presenca(
   codigo_evento text,
   nome text,
   email text,
	FOREIGN KEY (codigo_evento) REFERENCES eventos(codigo)
)

