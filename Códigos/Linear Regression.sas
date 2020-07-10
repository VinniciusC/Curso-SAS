data sevenminscreen;
infile '/home/u49285826/sasuser.v94/7minscreen (3).csv' DSD missover firstobs=2;
INPUT x y;
RUN;

proc reg data=sevenminscreen;
model y=x / all;
plot y*x /PRED;
run;