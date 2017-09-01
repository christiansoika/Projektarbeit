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

eps0=5.21732; urms0=0;\
set output "dEFdt_time.tex"
unset ylabel
set yrange[0:8]
set xrange [0:2]
set ytics 2
set title "$(dE_k/dt)^*$" offset -15,-0.8
set key spacing 1.2
plot "../64_sameSeed/kineticEnergy" u 1:(urms0=0) every :::0::0 w p ls 1 notitle,\
"" u 1:(urms0=max(urms0,$4),0/0) every :::0::0 w p ls 1 notitle,\
"" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($8) w l lt 1 lc 1 lw 2 title "$LES_{64}$",\
"../96_sameSeed/kineticEnergy" u 1:(urms0=0) every :::0::0 w p ls 1 notitle,\
"" u 1:(urms0=max(urms0,$4),0/0) every :::0::0 w p ls 1 notitle,\
"" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($8) w l lt 1 lc 2 lw 2 title "$LES_{96}$",\
"../128_sameSeed/kineticEnergy" u 1:(urms0=0) every :::0::0 w p ls 1 notitle,\
"" u 1:(urms0=max(urms0,$4),0/0) every :::0::0 w p ls 1 notitle,\
"" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($8) w l lt 1 lc 3 lw 2 title "$LES_{128}$",\
"../256_sameSeed/kineticEnergy" u 1:(urms0=0) every :::0::0 w p ls 1 notitle,\
"" u 1:(urms0=max(urms0,$4),0/0) every :::0::0 w p ls 1 notitle,\
"" u ($2*eps0*1.5*1.5/(urms0*urms0)/64):($8) w l lt 2 lc -1 lw 2.5 title "$DNS$"
