DATA NEWHOMES;
INFILE '/home/u49285826/sasuser.v94/newhomes (2).txt';
input type$ price tax;
RUN;

data reducednewhomes; set newhomes;
keep type price; /* tem tb drop */
run;

data renamed; set newhomes;
RENAME type=x
	   price=y
	   tax=z;
		run;
		
data cleannew; set newhomes;
	label type='type of home'
		  price='price of home'
		  tax='tax percentage of home';
		  RUN;
		  
		  proc freq data=cleannew;
		  Table type price tax;
		  run;