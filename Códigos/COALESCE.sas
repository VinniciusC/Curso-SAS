data coalesce;
input home cell;
numavailable= Coalesce(home,cell);
datalines;
6578975 454524545
. 6448565
run;

proc print data=coalesce;
run;