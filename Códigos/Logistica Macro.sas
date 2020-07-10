data train;
infile '/home/u49285826/sasuser.v94/train.csv' DSD missover firstobs=2;
input Passenger Survived Pclass Name$ Sex$ Age SibSp Parch Ticket$ Fare Cabin$ Embarked$;
run;

%macro logitma(inpdata,depvar,indvar=,myout=_out);
%let k=1;
%let dep=%scan(&depvar,&k);
%do %while (&dep NE);
title "The dependent variable is &depvar";
title2 "The independent variables are &indvar";
proc logistic data=&inpdata outest=est&k;
model &dep = &indvar;
run;
%let k=%eval(&k+1);
%let dep=%scan(&depvar,&k);
%end;
data &myout;
set 
%do i=1 %to &k-1;
est&i
%end;
;
run;
%mend;

%logitma(train,Survived Pclass, indvar=age,myout=myparm)