data assignment2solution;
length Name$ 40	JobTitles$ 50 Dep$ 25 FullorPart$ 1	SalorHour$ 6 TypicalH 8	Annual$ 10 Hourly$ 5;
infile '/home/u49285826/sasuser.v94/Current_Employee_Names__Salaries__and_Position_Titles (2).csv' firstobs=2 DSD MISSOVER;
input Name$	JobTitles$ Dep$	FullorPart$	SalorHour$ TypicalH Annual Hourly;

AnnualS=input(Annual,comma9.);
HourlyR=input(Hourly,comma9.);

salorhourly = Coalesce(AnnualS,HourlyR);

Run;

proc print data=assignment2solution;
where HourlyR>=50;
format HourlyR Dollar11.2;
var Name HourlyR;
