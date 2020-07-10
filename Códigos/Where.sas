data sales;
input Name$ Sales_1-Sales_4;
total=Sales_1+Sales_2+Sales_3+Sales_4;
cards;
Greg 10 2 40 0
John 15 5 10 100
Lisa 50 10 15 50
Mark 20 0 5 20
run;

proc sql;
select Total from sales
where Total >50;

proc print data=sales(where=(total>50));
run;

proc print data=sales;
where total>50;
run;