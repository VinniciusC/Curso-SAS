Data beer;
INPUT brand$ origin$ price;
CARDS;
Budweiser USA 14.99
Corona MEX 12.99
;
RUN;

Data beerr;
INPUT brand$ 1-9 origin$ 10-12 price 13-17;
CARDS;
BudweiserUSA14.99
Corona   MEX12.99
;
RUN;