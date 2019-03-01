clear all; close all;
%
% Exercise 8: Question 1
%

% First load data
load('bayes1data.mat');

% Plot classes
plotclass(mu, Sigma);

% Plot data, class 1 in red
plot(data(1, :), data(2, :), '.');
plot(data(1, classes == 1), data(2, classes == 1), 'rx');

solution=bayes1(mu,Sigma,data);

%% Function C
function C = bayes1(mu,Sigma,data)

% Calculate Vector
    I=2;
    s=length(data);
    numofclasses=size(mu,2); % Size of the matrix

    P_class=zeros(numofclasses,s);

    for i=1:numofclasses
        for j=1:s
            P_class(i,j)=(1/((2*pi)^(I/2)*det(Sigma(:,:,i))^(1/2)))*exp(-(1/2)*([data(1,j);data(2,j)]-mu(:,i))'*Sigma(:,:,i)^(-1)*([data(1,j);data(2,j)]-mu(:,i)));
        end
    end

% Calculate solution
    solution=zeros(1,s);

    for i=1:s
            solution(i)=1;
            for j=2:numofclasses
                if P_class(j,i)>P_class(j-1,i)
                    solution(i)=j;
                end
            end
    end

    C=solution;

    end