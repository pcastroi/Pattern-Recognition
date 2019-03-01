clear all; close all;
%
% Exercise 8: Question 2
%

% First load data
load('bayes1data.mat');

traindata=data;
trainclasses=classes;

n=length(traindata);
classd1=zeros(2,n);
classd2=zeros(2,n);
classd3=zeros(2,n);

for i=1:n
    if trainclasses(i)==1
        classd1(:,i)=traindata(:,i);
    else
        if trainclasses(i)==2
            classd2(:,i)=traindata(:,i);
        else
            classd3(:,i)=traindata(:,i);
        end
    end
end

count1 = 0;
count2 = 0;
count3 = 0;

for i=1:n
    if classd1(i)~=0
        count1=count1+1;
    end
    if classd2(i)~=0
        count2=count2+1;
    end
    if classd3(i)~=0
        count3=count3+1;
    end
end

aux_classd1 = zeros(2,n);
aux_classd2 = zeros(2,n);
aux_classd3 = zeros(2,n);

for i=1:n
    if classd1(i)~=0
        aux_classd1(:,i) = classd1(:,i);
    end
    if classd2(i)~=0
        aux_classd2(:,i) = classd2(:,i);
    end
    if classd3(i)~=0
        aux_classd3(:,i) = classd3(:,i);
    end
end

% aux_classd1 = aux_classd1(1,count1);
% aux_classd2 = aux_classd2(1,count2);
% aux_classd3 = aux_classd3(1,count3);

%% Function C
function C = bayes3(trainclass, traindata, data)
    n=length(traindata);
    classd1=zeros(1,n);
    classd2=zeros(1,n);
    classd3=zeros(1,n);
    for i=1:n
        if trainclasses(i)==1
            classd1(i)=traindata(:,i);
        else
            if trainclasses(i)==2
                classd2(i)=traindata(:,i);
            else
                classd3(i)=traindata(:,i);
            end
        end
    end
end