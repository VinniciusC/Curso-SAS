data rand; 
call streaminit(12345);
do i=1 to 10;
	x = rand("Normal");
	output;
end;
run;

goptions ftext=arial;
proc gchart data=rand;
vbar x;
title "Random Values from N(0,1)";
run;

proc freq data=rand;
run; 
