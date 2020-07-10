data londonoutcomes;
infile '/home/u49285826/sasuser.v94/london-outcomes.csv' DSD MISSOVER FIRSTOBS=2;
input CrimeId$ ReportedF$ FallsW$ Longitude Latitude Location$ LSOAC$ LOSAN$ OutcomeT$;
run;

PROC FREQ data=londonoutcomes(keep=LSOAC);

PROC datasets;
modify londonoutcomes;
index create LSOAC/;
run;
options msglevel=I;
data usingindex;
set londonoutcomes;
where LSOAC is missing;
run;

proc datasets; 
modify londonoutcomes;
index create compind=(CrimeID LSOAC);
RUN;

proc sql;  drop index LSOAC   from londonoutcomes;

options msglevel=I;
data usingindex;
set londonoutcomes;
where LSOAC is missing;
run;