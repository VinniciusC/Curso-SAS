DATA houseprice;
INFILE '/home/u49285826/sasuser.v94/houseprice (2).txt';
INPUT type$ price tax;
Actualamountof = Round(price*tax); 
RUN;