DATA TAXPROB;
   INPUT SS SALARY AGE RACE $;
   FORMAT SS SSN11.; 
DATALINES;
123874414 28000 35 W
646239182 29500 37 B
012437652 35100 40 W
018451357 26500 31 W
;


TITLE "TaxProb dataset";
PROC PRINT DATA=TAXPROB;
RUN;

DATA TAXPROB_AGE;;
SET TAXPROB;
IF AGE<=35 THEN AGE_GROUP=1;
ELSE AGE_GROUP=2;
RUN;


TITLE " TaxProb dataset with AgeGroup";
PROC PRINT DATA=TAXPROB_AGE;
RUN;


TITLE "Race and age group count";
PROC FREQ DATA=TAXPROB_AGE;
TABLES RACE*AGE_GROUP/ NOROW NOCOL NOPERCENT;
RUN;
