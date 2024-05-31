# Discente: Felipe Azevedo Ribeiro
# Data: 29/04/2024

# $3 município
# $8 data
# $11 casos acumulados
# $14 óbitos
# $16 casos novos em acompanhamento

rm -f response_30_04.txt

touch response_30_04.txt


awk -F ";" '

    function max(val1,val2){
        if (val1 > val2)
                return val1
        else
                return val2
    }

    BEGIN{
    totalObitos=0;
    maiorQuantidadeObitos=0;
    }
    {
        if($2 == "BA" && length($3) > 0) {
            obitos[$3]+=$14;
            max_data[$3]=$8;
            if ($3 in cidade) {
                data[$3]=$8;
                if (!max_data[$3] || max_data[$14] > max_data[$14]) {
                    max_data[$3] = max_data[$14];
                }
            } else {
                cidade[$3]=$3;
                data[$3]=$8;
                if (!max_data[$3] || max_data[$14] > max_data[$14]) {
                    max_data[$3] = max_data[$14];
                }
            }
        }
    }
            END{
                for (c in cidade) {
                    print "\nMunicípio: " c;
                    print "Data com maior número de óbitos: " max_data[c];
                    print "Total de óbitos: " obitos[c];
                }
            }' ../HIST_PAINEL_COVIDBR_2023_Parte2_29mar2024.csv > response_30_04.txt