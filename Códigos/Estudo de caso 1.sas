data identifyconditions;
infile '/home/u49285826/sasuser.v94/casestudy (2).csv' DSD MISSOVER FIRSTOBS=2;
input ID$ SEX$ DOB Pdx Dx_2 Dx_3 Dx_4;
informat DON date9.;
run;

proc sort data=identifyconditions out=identifyconditionstwo;
by ID;
run;

proc print data=identifyconditionstwo;
format DOB date9.;
run;

data MemberConditions;  
set identifyconditionstwo;  
by ID;  
length Diabetes Depression COPD Asthma CKD HIV Schizophrenia Hypertension Migraine $14 Conditions $50; 
retain Diabetes Depression COPD Asthma CKD HIV Schizophrenia Hypertension Migraine  Conditions;

if first.ID then 
do;  
Diabetes =""; 
Depression =""; 
COPD ="";  
Asthma ="";  
CKD=""; 
HIV=""; 
Schizophrenia=""; 
Hypertension=""; 
Migraine=""; 
end;

array diag(4) Pdx Dx_2 Dx_3 Dx_4; 
do i= 1 to 4; 
if diag(i) in: ("25000") then 
Diabetes="Diabetes"; 
if diag(i) in: ("29620") then 
Depression="Depression"; 
if diag(i) in: ("4912") then 
COPD="COPD"; 
if diag(i) in: ("493") then 
Asthma="Asthma"; 
if diag(i) in: ("40300") then 
CKD="CKD"; 
if diag(i) in: ("042") then 
HIV="HIV"; 
if diag(i) in: ("3310") then 
Schizophrenia="Schizophrenia"; 
if diag(i) in: ("5723") then 
Hypertension="Hypertension"; 
if diag(i) in: ("34631") then 
Migraine="Migraine"; 
end;

if last.ID then 
do;  
TotConditions = sum(( Diabetes ne ""),( Depression ne ""), (COPD ne ""), ( Asthma ne ""), (CKD ne ""),(HIV ne ""),(Schizophrenia ne ""), (Hypertension ne ""), (Migraine ne "") );    
Conditions = catx(", ", Diabetes, Depression,  COPD, Asthma,CKD,HIV,Schizophrenia,Hypertension,Migraine);  
output;   
end;   
keep ID Sex DOB ToTConditions Conditions;  
run;

proc print data=MemberConditions; format DOB date9.; run;