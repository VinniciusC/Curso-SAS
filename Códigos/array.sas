data sixvar;
infile '/home/u49285826/sasuser.v94/6var (2).txt';
INPUT var_1-var_6;
RUN;

data recode;
set sixvar;
if var_1 < 5 then var_2=.;
run;

data recodearray;
set sixvar;
array recodearr(6) var_1-var_6; 
do i= 1 to 6;
if recodearr(i) < 40 then recodearr(i)=.;
end;
run;

data newvar;
set sixvar;
array ovar(6) var_1-var_6;
array newtax(6)  tax_1-tax_6;
do i=1 to 6;
newtax(i)=ovar(i)*1.15;
end;
run;