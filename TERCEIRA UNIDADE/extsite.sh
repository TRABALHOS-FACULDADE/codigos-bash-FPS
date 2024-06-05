#!/bin/bash

### Data: 30/05/2024
### Discente: Felipe Azevedo Ribeiro
### Docente: José Marivaldo de Aragão Silva

version="1.0.0"

dialog  --msgbox   "Bem vindo(a)s ao portal PokéMothim CLI!\nDesenvolvido por: Felipe Azevedo Ribeiro\nVersão: $version" 10 70

decision=$(dialog --menu "Deseja acessar o portal?" 12 45 25 1 "Sim" 2 "Não" --output-fd 1)

if [ "$decision" = 2 ]; then
    clear
    exit
else
    clear
fi

titulos=(
    "Pokémon GO"
    "Pokémon (Anime)"
    "Análise de Pokémon"
)

temas=(
    "pokemon-go"
    "anime"
    "análise"
)

option=$(dialog --menu "Deseja obter informações e notícias relacionadas a qual tema do mundo Pokémon?" 12 45 25 1 "Pokémon GO" 2 "Pokémon (Anime)" 3 "Análise de Pokémon" --output-fd 1)

clear

opcaoSelecionada="${titulos[$(($option-1))]}"
keySelecionada="${temas[$(($option-1))]}"

base_url="https://www.pokemothim.net"

echo ""
echo "Buscando informações relacionadas a $opcaoSelecionada"
echo "Aguarde..."
echo ""

extrair_dados() {
    arg="$1"
    tema="${arg//[á]/a}"
    arquivo_saida="pokemothim_$tema.txt"

    # Acessar a página principal do tema
    lynx --listonly \
    --nonumbers \
    --display_charset=utf-8 \
    --dump "$base_url"/search?q="$tema" | sed 's/[0-9]*\. //g' | sed '/#/d' | grep "$tema" > temp.txt

    # Extrair dados de cada link da página principal
    while read -r url; do
        lynx -dump "$url" >> "$arquivo_saida"
    done < temp.txt

    rm temp.txt

    dialog --msgbox  "Arquivo de texto com informações sobre $opcaoSelecionada foi gerado com sucesso!" 10 25
    clear
}

# Execução principal
extrair_dados "$keySelecionada"
