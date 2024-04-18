# Discente: Felipe Azevedo Ribeiro
# Data: 17/04/2024

rm -f response_23_04.txt

touch response_23_04.txt

awk -F ";" 'BEGIN{
    casosAcumulado=0;
    emAcompanhamentoNovos=0;
    somaTotal=0;
    }
    {
        if($2 == "BA" && $3 == "Salvador" && $8 >= "2023-11-01" && $8 <= "2023-11-30") {
            casosAcumulado+=$11;
            emAcompanhamentoNovos+=$16;
            somaTotal += casosAcumulado+emAcompanhamentoNovos;
            print "Soma das colunas na data " $8 ": " casosAcumulado+emAcompanhamentoNovos
        }
    }
            END{
                print "\nSoma TOTAL das colunas: " somaTotal;
            }' ../HIST_PAINEL_COVIDBR_2023_Parte2_29mar2024.csv > response_23_04.txt