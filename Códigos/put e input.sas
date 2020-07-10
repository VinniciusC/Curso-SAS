data inputfunc;
input sale $9.;
numsale=input(sale, comma9.); /*converte para numero e put faz o inverso*/
datalines;
6,515,353
;
run;

proc print data=inputfunc;
run;