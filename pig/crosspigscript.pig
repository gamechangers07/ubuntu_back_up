
A = LOAD 'crossdata1.txt' using PigStorage(' ') as (x:int,y:int,z:int);
B = LOAD 'crossdata2.txt' using PigStorage(' ') as (x:int,y:int,z:int);
C = CROSS A, B;
STORE C into 'crossScriptOut';
