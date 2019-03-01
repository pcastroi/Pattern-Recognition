clear all; close all;
%
% Exercise 11: Question 1
%

% First load data
load('data1.mat');
load('data2.mat');
load('data3.mat');

% Testing values
C=5;

% Apply the function svm to the 3 given classes and data
r=svm2(data1, class1, data1, C);