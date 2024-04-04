#!/bin/bash

# Discente: Felipe Azevedo Ribeiro

for arq in * # Percorre todo o diretório atual do usuário
# "arq" é uma variável auxiliar que armazena o nome de cada arquivo ao decorrer do loop
# o "*" serve para indicar que queremos TODOS os arquivos presentes no diretório
do # inicializa o escopo do loop
if [ -x "$arq" ] # verifica se o arquivo atual no loop é executável
then
    # "echo" é um comando utilizado para IMPRIMIR uma mensagem no terminal
    # o caractere "$" serve para acessarmos o valor contido em uma variável
    echo Arquivo $arq é do tipo 1
    # caso o arquivo seja executável, irá imprimir a mensagem do tipo 1
else
    echo Arquivo $arq é do tipo 2
    # caso contrário, irá imprimir a mensagem do tipo 2
fi # finaliza o escopo do if
done # finaliza o escopo do loop