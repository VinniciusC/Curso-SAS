DATA houseprice;
INFILE '/home/u49285826/sasuser.v94/houseprice (2).txt';
input type$ price tax;
RUN;

data newhomes;
INFILE '/home/u49285826/sasuser.v94/newhomes (2).txt';
input type$ price tax;

PROC SORT data=houseprice out=houseprice2;
BY price;
RUN;

PROC SORT data=newhomes out=newhomes2;
BY price;
RUN;

DATA newcollections;
MERGE houseprice2 newhomes2;
by price;
run;