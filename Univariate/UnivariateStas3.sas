DATA BLOOD;
   LENGTH GROUP $ 1;
   INPUT ID GROUP $ TIME WBC RBC @@;
DATALINES;
1 A 1 8000 4.5   1 A 2 8200 4.8   1 A 3 8400 5.2
1 A 4 8300 5.3   1 A 5 8400 5.5
2 A 1 7800 4.9   2 A 2 7900 5.0
3 B 1 8200 5.4   3 B 2 8300 5.4   3 B 3 8300 5.2
3 B 4 8200 4.9   3 B 5 8300 5.0
4 B 1 8600 5.5
5 A 1 7900 5.2   5 A 2 8000 5.2   5 A 3 8200 5.4
5 A 4 8400 5.5
;

TITLE "Given blood data set";
PROC PRINT DATA=blood;
RUN;

*Printing the data set with id and gender in output using by;
PROC MEANS DATA=BLOOD NOPRINT;
BY ID GROUP;
VAR WBC RBC;
OUTPUT OUT=BLOOD2
MEAN= M_WBC M_RBC;
RUN;


TITLE "Modified blood data set with id and gender";
PROC PRINT DATA=BLOOD2;
RUN;


DATA BLOOD3;
SET BLOOD2;
IF _FREQ_ <= '2' THEN DELETE;
RUN;

*Printing the final dataset;
TITLE "Final Dataset";
PROC PRINT DATA=BLOOD3 (DROP=_FREQ_ _TYPE_) NOOBS;
RUN;