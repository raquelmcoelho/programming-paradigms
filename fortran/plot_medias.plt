set term x11 font "-*-helvetica-medium-r-*-*-14-*-*-*-*-*-*-*"
set title "Crescimento do Numero de Operacoes de Somas Calculando a Media em Lote"
set nokey
set grid
set ylabel "Operacoes"
set xlabel "N"
set style data lines
set datafile separator whitespace
set style line 1 linewidth 4
m="data_medias.txt"
set terminal png size 1024,768
set output 'output.png'
plot m using 1:2
