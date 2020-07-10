data staff;
input empid$ fname$ salary;
datalines;
123 dsasd 5000
124 wwrerw 7000
125 sadsd 8000
run;

data staff2;
input empid$ fname$ salary;
datalines;
123 dsasd 5000
124 wwrerw 7000
125 sadsd 9000
126 dasdas 6000
run;

proc sql;
select * from staff2
EXCEPT
select * from staff;
run;