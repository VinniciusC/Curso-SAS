data bringittoghether;
separator = ',';
first = '   Larry';
last = 'Larryson     ';
result = catx(separator,PROPCASE(first),PROPCASE(last)); /*Junta usando um delimitador e tira espacos em branco*/
SCANN = scan(result,2); /*mostra a palavra na posicao definida pelo segundo arg. OBS TEM Q SER JUNTADA ANTES*/
drop separator;
run;

proc print data=bringittoghether;
run;