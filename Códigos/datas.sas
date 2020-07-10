DATA dates;
INPUT name$ bday datell.;
CARDS;
Eric 4 Mar 1985
Doug 15 Feb 1976
Sean 14 Jun 1975
;
RUN;  

PROC PRINT DATA=dates; 
FORMAT bday date9.;
RUN;