set datafile separator ","

set title "{/Symbol D}X vs {/Symbol D}P "
set key top left
set xlabel " {/Symbol D}P [K P_a] "
set ylabel " {/Symbol D}X [cm]"
set log xy

set grid
set key bottom center box height 1.4


set style line 1 \
    linecolor rgb 'red' \
    linetype 0 linewidth 0 \
    pointtype 7 pointsize 1 

set style line 2 \
    linecolor rgb 'blue' \
    linetype -1 linewidth 2 \
    pointtype 7 pointsize 0 


f(x) = m * x + q     

fit f(x) 'isoterma0.txt' u (log($1)):(log($2)) via m, q
f(x) = exp(m * log(x) + q )

plot 'isoterma0.txt' u 1:2 with linespoints linestyle 1 title 'Data' 
replot f(x) linestyle 2 title 'Fit'




