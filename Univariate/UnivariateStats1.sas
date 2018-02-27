DATA PATIENTS;
   INPUT @1  ID          $3.
         @4  DATE   MMDDYY8. 
         @12 HR           3.
         @15 SBP          3.
         @18 DBP          3.
         @21 DX           3.
         @24 DOCFEE       4.
         @28 LABFEE       4.;
   FORMAT DATE MMDDYY10.;
DATALINES;
0071021198307012008001400400150
0071201198307213009002000500200
0090903198306611007013700300000
0050705198307414008201300900000
0050115198208018009601402001500
0050618198207017008401400800400
0050703198306414008401400800200
;

Proc sort Data=PATIENTS;
by ID DATE ;

DATA EXCL1;
SET PATIENTS;
BY ID;
IF FIRST.ID THEN DELETE;
RUN;

PROC MEANS DATA=EXCL1 MEAN MAXDEC=1;
VAR HR SBP DBP;
TITLE "REQUIRED MEAN DATA EXCLUDING PATIENT1";
RUN;