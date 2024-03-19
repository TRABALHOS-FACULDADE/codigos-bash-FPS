#!/bin/bash

# Discente: Felipe Azevedo Ribeiro

# o uso de "$1" serve para pegar o primeiro argumento do comando no terminal, ou seja:
# bash tipos.sh teste_4.exe resultaria em: "teste_4.exe resulta em RC = 2"

function tipo_arquivo() {
    local file=$1
    if [ -d "$file" ] # Identificar se é um diretório
    then
        return "1"
    elif [ -x "$file" ] && [ -f "$file" ] # Identificar se é um executável
    then
        return "2"
    else # Identificar se é um arquivo comum ou se não existe
        return "0"
    fi
}

file=$1
tipo_arquivo "$file" 
echo $tipo_arquivo