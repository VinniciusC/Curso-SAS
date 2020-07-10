data train;
infile "/home/u49285826/sasuser.v94/train_bank.csv" DSD Missover FIRSTOBS=2;
input Loan_ID$ Gender$ Married$ Dependents$ Education$ Self_Employed$ Applicant Co_applicant Loan_AMount L_Amount_Term Credit_History Property$ Loan_Status$;
run;

data test;
infile "/home/u49285826/sasuser.v94/test.csv" DSD Missover FIRSTOBS=2;
input Loan_ID$ Gender$ Married$ Dependents$ Education$ Self_Employed$ Applicant Co_applicant Loan_AMount L_Amount_Term Credit_History Property$ Loan_Status$;
run;

proc contents data= train;
run;

proc print data=train (obs=20);
run;

proc gchart data=train;
vbar Loan_Status;
run;