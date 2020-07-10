DATA filter;
set houseprice;
IF price<200000;
run;