#!/bin/bash

# Discente: Felipe Azevedo Ribeiro

df -h > /tmp/dfh
STATUS=`echo "$?"`

if [ $STATUS -eq 0 ]; then
    logger "Executou com sucesso" -t LoggerScript -f /var/log/messages
else
    logger "Falhou ao executar comando df" -t LoggerScript -f /var/log/messages
fi

set -x

echo -n Insira o argumento desejado:
# Possíveis inputs: backup, temporario1, temporario2 (em qualquer case - upper ou lower)

read ARGUMENTO

function backupCalled() {
    mkdir -p ./Backup
    cp ./* ./Backup
    for arq in ./Backup/*
    do
        nome_sem_extensao="${arq%.*}"
        extensao_do_arquivo="${arq##*.}"
        data_hora=$(date +"%a %d %b %Y %H:%M:%S")
        novo_nome="${nome_sem_extensao// /-}_Felipe-Ribeiro_${data_hora//:/-}.${extensao_do_arquivo}"
        if [ "$arq" != "$novo_nome" ]
        then
            mv "$arq" "$novo_nome" # Renomeia o arquivo
        fi
    done
}

function temporarioCalled() {
    mkdir -p ./Tmp
    for arq in *
    do
    primeira_letra="${arq:0:1}"

    if [ "$1" == "1" ] # Verifica se o argumento foi "temporario1"
    then
        # Verifica se a primeira letra é uma vogal
        if [[ "$primeira_letra" =~ [aeiouáéíóúâêîôûAEIOUÂÊÎÔÛÁÉÍÓÚ] ]]
        then
            cp ./"${arq}" ./Tmp
        fi
    else # Caso o argumento seja "temporario2"
         # Verifica se a primeira letra é uma consoante
        if [[ ! "$primeira_letra" =~ [aeiouáéíóúâêîôûAEIOUÂÊÎÔÛÁÉÍÓÚ] ]]
        then
            cp ./"${arq}" ./Tmp
        fi
    fi

    done
}

function deleteAll() {
    set -e
    if [ -d ./Backup ]
    then
        rm -rf ./Backup ## Deleta o diretório
    fi
    if [ -d ./Tmp ]
    then
        rm -rf ./Tmp ## Deleta o diretório
    fi
}

function copyFiles() {
    # ${ARGUMENTO,,} converte qualquer input de ARGUMENTO para minúsculo. Ou seja: ignora o case da palavra
    set -e
    case "${ARGUMENTO,,}" in
        "backup")
            backupCalled
        ;;
        "temporario1")
            temporarioCalled "1"
        ;;
        "temporario2")
            temporarioCalled "2"
        ;;
        *)
        deleteAll
        ;;
    esac
}

copyFiles