DATA A;
input years;
datalines;
4
3
6
3
9
run;

DATA B;
set A;
if years > 5 then
do; 
months=years*12;
put years= months=;
end;
else yrsleft=5-years;
run;