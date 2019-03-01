clear all; close all;
%
% Exercise 10: Question 1
%

% First load data
load('data1.mat');
load('data2.mat');
load('data3.mat');

% Testing values
C=5;

% Apply the function svm to the 3 given classes and data
[w_1, w0_1]=svm(data1, class1, C);
[w_2, w0_2]=svm(data2, class2, C);
[w_3, w0_3]=svm(data3, class3, C);