%Exercise 4 - Question 1
clear all
close all
load('t082');
a = size(x,2);
b = length(x);
%covariance of x
cv = cov(x);
%eigenvectors of cv, v & d
[v,d] = eig(cv);
%contributions of each eigenvector
f1 = d(1,1);
f2 = d(2,2);
f3 = d(3,3);
for farr = [f1 f2 f3]
    pf = farr/(f1+f2+f3)
end