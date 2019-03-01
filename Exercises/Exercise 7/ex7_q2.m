clear all;close all;
%
% Exercise 7: Question 2
%
load('t087.mat') % Load 
c_m=[1,0:0,1]; % Covariance matrix
sigma = 1;

dist = normpdf(X,0,1);


[phat,pci] = mle(X,'norm',dist)
