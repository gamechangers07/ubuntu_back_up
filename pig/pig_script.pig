-A = LOAD '/user/pig/input.txt'  using PigStorage as (id:int,name:chararray,sal:float);
B = FOREACH A generate name;
STORE B INTO 'pigoutut';


A = LOAD 'passwd'using PigStorage(':') ;


EMP = LOAD 'input.txt'  using PigStorage as (id:int,name:chararray,sal:float, dept:chararray);
SAL_FIL = FILTER EMP BY sal>15000;
SORT = ORDER SAL_FIL BY sal DESC;
DUMP SORT;

A = LOAD 'tuples.txt' using PigStorage as (t1:tuple(t1a:int,t1b:int,t1c:int),t2:tuple(t2a:int,t2b:int,t2c:int));
X = FOREACH A GENERATE t1.t1a,t2.$0;
DUMP X;


A = LOAD 'misc.txt' using PigStorage as (f1:int,f2:int,f3,int);
B = GROUP A By f1;



A = LOAD 'sample2.txt' using PigStorage as (f1:int,f2:int,f3:int);
B = GROUP A BY f1;
C = FOREACH B GENERATE group, SUM(A.f2);
D = FOREACH B GENERATE FLATTEN (A.f2);
E = DISTINCT D;

STORE C INTO 'home/pbalwani/pig'


A = LOAD '/home/pbalwani/pig/crossdata1.txt' using PigStorage(' ') as (f1:int,f2:int,f3:int);

A = LOAD 'crossdata1.txt' using PigStorage(' ') as (x:int,y:int,z:int);



A = LOAD 'joindata1.txt' using PigStorage (',') as (a:int,b:int,c:int);
B = LOAD 'joindata2.txt' using PigStorage (',') as (x:int,y:int,z:int);
C = Join A BY A.a, B BY B.x;


A = LOAD 'joindata3.txt' as (int,chararray,int);
B = LOAD 'joindata4.txt' as (int,chararray,int);
C = JOIN A by $0 LEFT OUTER, B By $1;


A = LOAD 'joindata1.txt' using PigStorage(',') as (int,int,int);
B = LOAD 'joindata2.txt' using PigStorage(',') as (int,int,int);
C = COGROUP A BY $0 inner, B BY $0 inner;

A = LOAD 'lines.txt' as (f1:chararray);
B = FOREACH A GENERATE TOKENIZE(f1);


A = LOAD 'average.txt' as (name:chararray,term:chararray,gpa:float);
B = GROUP A BY name;
C = FOREACH B GENERATE group,AVG(gpa);

1,yuganit@gmail.com,English,Irvine
2213,400,1,14000,iPhone
U = LOAD 'users.txt' using PigStorage(',') as (uId:int,email:chararray,lang:chararray,loc:chararray);
T = LOAD 'transactions.txt' using PigStorage(',') as (tId:int,pId:int,uId:int,product:chararray);

J = JOIN U BY uId, T BY uId;
G = GROUP J BY pId;
D = FOREACH G { LOCS = DISTINCT J.loc;GENERATE group, COUNT(LOCS) as Loc_Cnt;} ;

 


