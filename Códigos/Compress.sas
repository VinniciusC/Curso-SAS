data compressd;
input phonen$1-15;
phone1 = compress(phonen);
phone2 = compress(phonen, '(-)','s'); /*usar 's' para tirar espaços em branco qnd foi passado outro caractere*/
datalines;
(314)459-4768
(314) 459-56 78
;
run;

proc print data=compressd;
run;