# chamada-eventos

Script para computar lista de presenças em eventos

## pre-requisitos

* python3
    
* zbar-tools 
    
* curl 
    
* qrencode 
    
* virtualenv 
    
* xterm
    
* sqlite3
    
## Run 

#### Para criar o banco e inicialiar:

$ `bash execute.sh <hmac-key>`

#### Para executar o simulador do app do cliente:

$ `bash scripts/client-simulator.sh <qrcode-evento.png> <nome-teste> <email-teste>`


## Modelo Atual

* Uma pessoa cuida do QRCode e verifica a quantidade de pessoas entrando na sala para quantidade de pessoas na lista de presença.

## Discussão

Se um usuário entrar na url contida no QRCode, ele pode enviar essa url para outro usuário, pra que ele confirme a presença no evento.

* Resolução do problema - gerar um QRCode dinâmico do evento, adicionando tempo de validade para o QRCode (e.g. 5 segundos). Depois, gerar novo QRCode.
