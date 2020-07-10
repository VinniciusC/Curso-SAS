data disease;
input diagcode$;
datalines;
001
290
800
001
290
;
run;

proc format;
value $codetwo
'001' = 'malaria'
'290' = 'covid'
'800' = 'leg injury';
run;

data diseasereal;
set disease;
diagdesc=put(diagcode,$codetwo.);
run;
