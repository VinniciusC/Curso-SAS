data new;
date = '06MAY98';
month = substr(date,3,3); /*substr(source, pos, n)*/
substr(date,6,2) = '16'; /*para substituir a partir do 6 contanto 2 char*/
run;