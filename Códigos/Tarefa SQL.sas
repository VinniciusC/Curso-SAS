data statesstats;
  length state $ 25 ;
  input State Zone$ Unemp Wage Crime Income;
cards;
Alabama S 6.0 10.75 780 27196 
Arizona S 6.4 11.17 715 31293 
Arkansas S 5.3 9.65 593 25565 
California W 8.6 12.44 1078 35331 
Colorado W 4.2 12.27 567 37833 
Connecticut E 5.6 13.53 456 41097 
Delaware E 4.9 13.90 686 35873 
Florida S 6.6 9.97 1206 29294 
Georgia S 5.2 10.35 723 31467 
Idaho N 5.6 11.88 282 31536 
Illinois N 5.7 12.26 960 35081 
Indiana S 4.9 13.56 489 27858 
Iowa N 3.7 12.47 326 33079 
Kansas S 5.3 12.14 469 28322 
Kentucky S 5.4 11.82 463 26595 
Louisiana S 8.0 13.13 1062 25676 
Maine E 7.4 11.68 126 30316 
Maryland E 5.1 13.15 998 39198 
Massachusetts E 6.0 12.59 805 40500 
Michigan N 5.9 16.13 792 35284 
Minnesota N 4.0 12.60 327 33644 
Mississippi S 6.6 9.40 434 25400 
Missouri N 4.9 11.78 744 30190 
Montana N 5.1 12.50 178 27631 
Nebraska N 2.9 10.94 339 31794 
Nevada W 6.2 11.83 875 35871 
New_Hampshire E 4.6 11.73 138 35245 
New_Jersey E 6.8 13.38 627 42280 
New_Mexico W 6.3 10.14 930 26905 
New_York E 6.9 12.19 1074 31899 
North_Carolina S 4.4 10.19 679 30114 
North_Dakota N 3.9 10.19 82 28278 
Ohio N 5.5 14.38 504 31855 
Oklahoma S 5.8 11.41 635 26991 
Oregon W 5.4 12.31 503 31456 
Pennsylvania N 6.2 12.49 418 32066 
Rhode_Island E 7.1 10.35 402 31928 
South_Carolina S 6.3 9.99 1023 29846 
South_Dakota N 3.3 9.19 208 29733 
Tennessee S 4.8 10.51 766 28639 
Texas S 6.4 11.14 762 30775 
Utah W 3.7 11.26 301 35716 
Vermont E 4.7 11.54 114 35802 
Virginia E 4.9 11.25 372 37647 
Washington E 6.4 14.42 515 33533 
West_Virginia S 8.9 12.60 208 23564 
Wisconsin N 4.7 12.41 264 35388 
Wyoming N 5.3 11.81 286 33140 
;
run;

proc sql;
create table finalstats as
select *,
Case 
when Unemp>=8 then 8
when Unemp<8 and Unemp >=5 then 6
else 4
end as UnemploymentR
from statesstats;
run;

proc sql;
alter table finalstats
add OverallCrimeRisk num label = 'OverallCrimeRisk' format=best8.;

proc sql;
update finalstats
set OverallCrimeRisk=UnemploymentR * crime/100;

select * from finalstats;
