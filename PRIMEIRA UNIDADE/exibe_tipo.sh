#!/bin/bash

# Discente: Felipe Azevedo Ribeiro

function get_file_type() {
  # Obter a extensão do arquivo
  file_extension="${file_name##*.}"
  
  local return_type=$(./tipos.sh "$1") # pega o código de retorno do primeiro script

  if [[ "$return_type" == "2" ]]
  then
    echo "$file_extension"
  elif [[ "$return_type" == "1" ]]
  then
    echo "Diretório (pasta)"
  else
    echo "Arquivo comum"
  fi
}
file_name="$1"
file_type=$(get_file_type "$file_name")
echo "O tipo do arquivo \"$file_name\" é \"$file_type\"."