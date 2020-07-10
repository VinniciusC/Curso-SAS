data staff;
input empid$ fname$ salary;
datalines;
123 dsasd 5000
124 wwrerw 7000
125 sadsd 8000
123 dsasd 5000
124 wwrerw 7000
125 sadsd 9000
126 dasdas 6000
run;


proc sql;
Title 'Duplicate rows';
select *, count(empid) as Count
	from staff
	group by empid, salary
	having count(empid)>1;

run;