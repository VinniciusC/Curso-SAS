DATA houseprice;
INFILE '/home/u49285826/sasuser.v94/houseprice (2) - Copy.txt';
INPUT type$ price tax;
RUN;

proc standard data=houseprice MEAN=0 STD=1 OUT=STDNEW;
var price tax;
RUN;

proc means data=STDNEW;
RUN;