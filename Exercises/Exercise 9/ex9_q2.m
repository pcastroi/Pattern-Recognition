clear all; close all;
%
% Exercise 9: Question 2
%

% First load data
load('data1.mat');
load('data2.mat');
load('data3.mat');

% Apply the function percep to the 3 given classes and data
[w1] = lms(class1,data1);
[w2] = lms(class2,data2);
[w3] = lms(class3,data3);

%% Function lms
function [w1]=lms(class,data)
    [~,m]=size(data);
    w1 =(rand(3,1)-0.5)/10;
    c_bool=boolean(zeros(1,m));
    for i=1:m
        if class(i)==1
            ndata(:,i)=data(:,i);
        end
        if class(i)==2
            ndata(:,i)=-data(:,i);
        end
    end
    e=10^-6;
    iteration=1;
    w0=[1;1;1];
    
    while norm(w1./norm(w1)-w0./norm(w0))>e
        r=0.5/iteration;
        for i=1:m
            x=[ndata(:,i);1];
            if (w1'*x)>0
               c_bool(i)=1;
            end    
        end
        symm=[0;0;0];
        for i=1:m
            if c_bool(i)==0
                x=[data(:,i);1];
                symm=symm-(w1'*x)*x;
            end
        end
        w0=w1;
        w2=w1-r*symm;
        w1=w2;
        iteration=iteration+1
    end
    w1=w1/norm(w1);

    % Plot
    N=-(w1(3)/w1(2));
    M=(-N)/(-(w1(3)/w1(1)));
    DBx=[-30 30];
    DBy=DBx.*M+N;
    figure
    plot(DBx,DBy,'--')
    for i=1:m
        hold on
        if class(i)==1
            plot(ndata(1,i),ndata(2,i),'rx')
        else
            plot(ndata(1,i),ndata(2,i),'mx')
        end
    end
    str_i = ['Number of iterations: ' num2str(iteration)];
    xlabel('Feature 1');
    ylabel('Feature 2');
    title({'Decision Boundary: LMS'; str_i});
end