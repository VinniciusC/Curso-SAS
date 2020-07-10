data errors valid;
input id$ stage:$5.;
if verify(stage,'abcd') then output errors;
else output valid;
cards;
001 aabcd
002 aabqc
;
run;