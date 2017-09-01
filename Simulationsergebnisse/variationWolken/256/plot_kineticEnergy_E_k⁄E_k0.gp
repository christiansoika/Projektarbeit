set term tikz standalone color dashed clip tightboundingbox size 5in,3in font "\\rmfamily,12pt" 

min(x,y)=x<y?x:y
max(x,y)=x>y?x:y

set size 0.8,1.0
set key top right
set ytics auto nomirror
set xtics auto nomirror
set style line 1 lc rgb 'black' pt 0

TL=1
EL=1

eps0=5.16128; urms0=0;\
set xrange [0:2]
set yrange[0:1]
set xlabel "$t^*$"
set ylabel "$E_k/E_{k,0}$"
set key spacing 1.2
set key font ",8"
set output "kineticEnergy_time.tex"
plot "./kineticEnergy_64" u 1:(urms0=0) every :::0::0 w p ls 1 notitle,\
"./kineticEnergy_64" u 1:(urms0=max(urms0,$4),0/0) every :::0::0 w p ls 1 notitle,\
"./kineticEnergy_64" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($4/urms0) w l lt 1 lc rgb 'black' lw 1 title "$(s.p.)_{256}$",\
"./kineticEnergy_64_m_c_1" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($4/urms0) w l lt 1 lc 7 lw 1 title "$(p.l.)_{256}$",\
"./kineticEnergy_64_m_c_10" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($4/urms0) w l lt 1 lc 1 lw 1 title "$(p.l.)_{256}  (m_c=10)$",\
"./kineticEnergy_64_m_c_50" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($4/urms0) w l lt 1 lc 2 lw 1 title "$(p.l.)_{256}  (m_c=50)$",\
"./kineticEnergy_64_m_c_100" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($4/urms0) w l lt 1 lc 3 lw 1 title "$(p.l.)_{256}  (m_c=100)$",\
"./kineticEnergy_64_m_c_1000" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($4/urms0) w l lt 1 lc 4 lw 1 title "$(p.l.)_{256}  (m_c=1000)$",\

