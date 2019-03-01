clear all; close all; clc;
% 
% Exercise 12: Question 2
%
load('data1.mat');
load('data2.mat');
load('data3.mat');
t1=zeros(size(data1));
t1(1,class1==1)=1;
t1(2,class1==2)=1;
t2=zeros(size(data2));
t2(1,class2==1)=1;
t2(2,class2==2)=1;
t3=zeros(size(data3));
t3(1,class3==1)=1;
t3(2,class3==2)=1;
nprtool;