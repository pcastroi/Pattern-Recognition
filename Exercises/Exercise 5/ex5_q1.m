% Exercise 5 - Question 1
clear all; close all;
load('t096');
c = cov(x1,x2);

%% Testing for the first array
m1 = mean(x1);
s1 = std(x1);
normdata1 = ((x1-m1)/s1);
[hK1,pK1] = kstest(normdata1);
[hL1,pL1] = lillietest(x1);

%% Testing for the second array
m2 = mean(x2);
s2 = std(x2);
normdata2 = ((x2-m2)/s2);
[hK2,pK2] = kstest(normdata2);
[hL2,pL2] = lillietest(x2);

hK1 
pK1
hK2 
pK2
hL1 
pL1
hL2 
pL2