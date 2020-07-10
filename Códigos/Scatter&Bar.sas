data houseprice;
INFILE '/home/u49285826/sasuser.v94/houseprice (2) - Copy.txt';
input type$ price tax;
RUN;

goptions ftext=arial;

proc gplot data=houseprice;
Title "Comparing the price and tax by type of home";
format price dollar9.;
symbol1 value=dot cv=blue;
symbol2 value=square cv=red;
plot price*tax=type;
RUN;

proc gchart data=houseprice;
Title "Comparing the price and tax by type of home";
format price dollar9.;
vbar price tax/ group=type;
pattern color=yellow;
run;
