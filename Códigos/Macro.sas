data houseprice;
INPUT type$ price tax;
datalines;

Single 150000 0.15
Single 160000 0.18
Duplex 180000 0.15
;
run;

%let newv=price;
proc means data=houseprice;
var &newv;
RUN;

%macro somestats;
proc means;
var price tax;
run;
%MEND;

data housepricetwo;
set houseprice;
if type= 'Single';
RUN;

%somestats;

%macro newstats (prog,vars);
proc &prog;
var &vars;
run;
%mend;

data housepricethree;
set houseprice;
if type= 'Single';
RUN;

%newstats(print,price tax);