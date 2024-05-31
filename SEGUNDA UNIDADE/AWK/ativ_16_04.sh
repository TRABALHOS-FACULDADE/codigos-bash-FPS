# Discente: Felipe Azevedo Ribeiro
# Data: 13/04/2024

rm -f response_16_04.txt

touch response_16_04.txt

awk -F ";" 'BEGIN{
    obitos=0;
    print "DATA;OBITOS_NESSA_DATA;";
    }
    {
        if($2 == "BA" && $3 == "Salvador" && $8 >= "2023-11-01" && $8 <= "2023-11-30") {
            obitos+=$14;
            print $8 ";" $14 ";";
        }
    }
            END{
                print "\nTOTAL DE ÓBITOS NOVOS: " obitos
            }' ../HIST_PAINEL_COVIDBR_2023_Parte2_29mar2024.csv > response_16_04.txt