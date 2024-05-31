#!/bin/bash

### Data: 30/05/2024
### Discente: Felipe Azevedo Ribeiro
### Docente: José Marivaldo de Aragão Silva

echo "Bem vindo(a)s ao portal PokéMothim CLI!"
echo "Deseja obter informações relacionadas a qual tema do mundo Pokémon?"
echo ""
echo "[1] Pokémon GO"
echo "[2] Pokémon Unite"
echo "[3] Pokémon Sleep"
echo "[4] Pokémon Scarlet & Violet"
echo "[5] Pokémon (Anime)"
echo ""

read OPCAO

base_url="https://www.pokemothim.net"

# Temas para extrair dados
temas=(
    "pokemon-go"
    "pokemon-unite"
    "pokemon-sleep"
    "pokemon-scarlet-violet"
    "anime"
)

extrair_dados() {
    tema="$1"
    arquivo_saida="pokemoth_$tema.txt"

    # Acessar a página principal do tema
    lynx --listonly \
    --nonumbers \
    --display_charset=utf-8 \
    --dump "$base_url"/search?q="$tema" | sed 's/[0-9]*\. //g' | grep "$tema" > temp.txt

    # Extrair dados de cada link da página principal
    while read -r url; do
        lynx -dump "$url" >> "$arquivo_saida"
    done < temp.txt

    rm temp.txt
}

opt=(OPCAO-1)
extrair_dados "${temas[$opt]}"
