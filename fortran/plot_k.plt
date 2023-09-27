set term x11 font "-*-helvetica-medium-r-*-*-14-*-*-*-*-*-*-*"
set title "Exemplo de Serie com Suavizacao por Filtragem"
set key top left
set grid
set xlabel "TEMPO"
set ylabel "Medida"
set style data lines
set datafile separator whitespace
set style line 1 linewidth 4
set style line 2 linewidth 5
set style line 3 linewidth 6
m="data_k.txt"
plot m using 1:2:2 title "Dados com Ruidos","" using 1:3:3 title "Media Movel", \
    "" using 1:4:4 title "Dados com filtro de Media",
