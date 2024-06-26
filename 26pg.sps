* Encoding: UTF-8.
* Encoding: .

*categorize the data according to the -ve question

RECODE y10 (0=3) (1=2) (2=1) (3=0) INTO y10.n.
VARIABLE LABELS  y10.n 'Converted Y10'.
EXECUTE.

RECODE yy4 (5=1) (4=2) (3=3) (2=4) (1=5) INTO yy4.n.
VARIABLE LABELS  yy4.n 'Converted yy4'.
EXECUTE.

*compute function

COMPUTE sumY=SUM(y1,y2,y3,y4,y5,y6,y7,y8,y9,y10.n).
EXECUTE.

COMPUTE sumYY=SUM(yy1,yy2,yy3,yy4.n,yy5).
EXECUTE.

*classification/ categorizing data

RECODE sumY (Lowest thru 20=1) (20 thru Highest=2) INTO sumY.cat.
EXECUTE.

VARIABLE LABELS
sumY.cat 'Stress Category'.

VALUE LABELS
sumY.cat
1 Non Stress
2 Stress.
*======

age = <30, 40 - 50, >50
income = <2000, 2001 - 4000, >4000

*categorize IVs (age and income)
*Age

RECODE x3 (Lowest thru 30=1) (31 thru 40=2) (40 thru Highest=3) INTO age.cat.
EXECUTE.

VARIABLE LABELS
age.cat 'Age Category'.

VALUE LABELS
age.cat
1 <30
2 31-40
3 >40.
*======

*Income

RECODE x4 (Lowest thru 2000=1) (2001 thru 4000=2) (4001 thru Highest=3) INTO income.cat.
EXECUTE.

VARIABLE LABELS
income.cat 'Income Category'.

VALUE LABELS
income.cat
1 <2000
2 2000 - 4000
3 >4000.
*======

FREQUENCIES VARIABLES=x1 x2 age.cat income.cat x5
  /ORDER=ANALYSIS.

*MCT/ MD

FREQUENCIES VARIABLES=x3 x4
  /FORMAT=NOTABLE
  /NTILES=4
  /STATISTICS=STDDEV MEAN MEDIAN MODE
  /ORDER=ANALYSIS.
*===== EDA ends===

*Normality


