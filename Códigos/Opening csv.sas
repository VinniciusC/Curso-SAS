DATA Weightgain;
INFILE '/home/u49285826/sasuser.v94/weightgain (2).csv' DSd MISSOVER FIRSTOBS=2;
INPUT id source$ type$ weight;
RUN;