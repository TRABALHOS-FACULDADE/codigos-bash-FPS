# Discente: Felipe Azevedo Ribeiro
# Data: 03/04/2024

rm -f response.csv
rm -f response.txt

touch response.txt

awk -F ";" 'BEGIN{obitos=0;casosNovos=0;count=0;}{if($2 == "BA" && $3 == "Salvador" && $8 >= "2023-07-01" && $8 < "2023-12-31") {casosNovos+=$12;obitos+=$14;count+=1; print "Data: " $8 "\n" "Óbitos novos: " obitos "\n" "Casos novos: " casosNovos "\n\n";}}END{print "TOTAL ÓBTIOS: " obitos "\n" "TOTAL CASOS: " casosNovos;}' ../HIST_PAINEL_COVIDBR_2023_Parte2_29mar2024.csv > response.txt

echo Gerou TXT

touch response.csv

awk -F ";" 'BEGIN{obitos=0;casosNovos=0;count=0; print "DATA;CASOS_NOVOS;ÓBITOS_NOVOS;";}{if($2 == "BA" && $3 == "Salvador" && $8 >= "2023-07-01" && $8 < "2023-12-31") {casosNovos+=$12;obitos+=$14;count+=1; print $8 ";" obitos ";" casosNovos ";";}}END{}' ../HIST_PAINEL_COVIDBR_2023_Parte2_29mar2024.csv > response.csv

echo Gerou CSV