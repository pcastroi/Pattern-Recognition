clear all; close all;
%
% Exercise 9: Question 1
%

% First load data
load('data1.mat');
load('data2.mat');
load('data3.mat');

% Apply the function percep to the 3 given classes and data
w1 = percep(class1,data1);
w2 = percep(class2,data2);
w3 = percep(class3,data3);

%% Function percep
function w = percep(class,data)
    c=zeros(size(class));
    aux_data=[data', ones(size(data,2),1)]';
    solution = rand(size(aux_data, 1), 1);
    % Normalization of the data
    for i=1:length(class)
        if (class(i)==2)
            aux_data(1,i)=aux_data(1,i)*(-1);
            aux_data(2,i)=aux_data(2,i)*(-1);
            aux_data(3,i)=aux_data(3,i)*(-1);
        end
    end
    % Initialize data
    x_max = max(aux_data(1, :)) + 1;
    x_min = min(aux_data(1, :)) - 1;
    y_max = max(aux_data(2, :)) + 1;
    y_min = min(aux_data(2, :)) - 1;
    iteration=1;
    for i=1:length(c)
        if (solution'*aux_data(:,i)>0)
            c(i)=1;
        else
            c(i)=0;
        end
    end
    count=0;
    for i=1:length(c)
        if (c(i)==0)
            count=1;
        end
    end
    % Iterate throught the function
    while ((count==1) && (iteration < 10000)) 
        jp_grad=[0;0;0];
        for i=1:length(c)
            if c(i)==0
                jp_grad=jp_grad-aux_data(:,i);
            end
        end
        solution_aux=zeros(size(solution));
        for i=1:length(solution)
            solution_aux(i)=solution(i)-(0.1/iteration)*(jp_grad(i));
        end
        for i=1:length(solution)
            solution(i)=solution_aux(i);
        end
        for i=1:length(c)
            if (solution'*aux_data(:,i)>0)
                c(i)=1;
            else
                c(i)=0;
            end
        end
        count=0;
        for i=1:length(c)
            if (c(i)==0)
                count=1;
            end
        end
        iteration=iteration+1;
    end
    % Plot the DB and the data
    figure
    hold off;
    plot(data(1, class==1), data(2, class==1), 'rx',-data(1, class==2), -data(2, class==2), 'mx');
    axis([x_min x_max y_min y_max]);
    str_i = ['Number of iterations: ' num2str(iteration)];
    xlabel('Feature 1');
    ylabel('Feature 2');
    title({'Decision Boundary: Perceptron'; str_i});
    hold on;
    line([x_min x_max], [-(solution(1) * x_min + solution(3)) / solution(2),-(solution(1) * x_max + solution(3)) / solution(2)]);
    w=solution;
end