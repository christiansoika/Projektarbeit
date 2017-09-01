set term tikz standalone color clip tightboundingbox size 5in,3in font "\\rmfamily,12pt" 

min(x,y)=x<y?x:y
max(x,y)=x>y?x:y

set size 0.8,1.0
set ytics auto nomirror
set xtics auto nomirror

TL=1
EL=1

eps0=5.21732; urms0=0; max29=0;\
set output "coupling_time.tex"
set ylabel "$\\psi$"
set xlabel "$t^*$"
set ytics 1
set xtics 0.5
set key spacing 1.2
set colorsequence default
set key bottom right 
set key font ",11"

#stats "./kineticEnergy_64_m_c_1" u 2:29 nooutput
#max29=abs(STATS_min_y);\

set xrange [0:2]
 
plot "./kineticEnergy_256" u 1:(urms0=0) every :::0::0 w p ls 1 notitle,\
"./kineticEnergy_256" u 1:(urms0=max(urms0,$4),0/0) every :::0::0 w p ls 1 notitle,\
"./kineticEnergy_256_m_c_1" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($29) w l lt 1 lc 7 lw 1 title "$(p.l.)_{256}$",\
"./kineticEnergy_256_m_c_10" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($29) w l lt 1 lc 1 lw 1 title "$(p.l.)_{256} (m_c=10)$",\
"./kineticEnergy_256_m_c_50" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($29) w l lt 1 lc 2 lw 1 title "$(p.l.)_{256} (m_c=50)$",\
"./kineticEnergy_256_m_c_100" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($29) w l lt 1 lc 3 lw 1 title "$(p.l.)_{256} (m_c=100)$",\
"./kineticEnergy_256_m_c_1000" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($29) w l lt 1 lc 4 lw 1 title "$(p.l.)_{256} (m_c=1000)$",\
