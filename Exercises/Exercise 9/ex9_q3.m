clear all; close all;
%
% Exercise 9: Question 3
%

% First load data
load('irisdata.mat');

% Input k value
% k=input('Assign value of k: ');
k=7;
C=knn(trainclass,traindata,data,k);
figure
hold on
plot(data(1, dataclass==1), data(2, dataclass==1), 'rx',data(1, dataclass==2), data(2, dataclass==2), 'mx', data(1, dataclass==3), data(2, dataclass==3), 'gx');
plot(traindata(1, trainclass==1), traindata(2, trainclass==1), 'r+',traindata(1, trainclass==2), traindata(2, trainclass==2), 'm+', traindata(1, trainclass==3), traindata(2, trainclass==3), 'g+');
hold off
figure
hold on
plot(data(3, dataclass==1), data(4, dataclass==1), 'rx',data(3, dataclass==2), data(4, dataclass==2), 'mx', data(3, dataclass==3), data(4, dataclass==3), 'gx');
plot(traindata(3, trainclass==1), traindata(4, trainclass==1), 'r+',traindata(3, trainclass==2), traindata(4, trainclass==2), 'm+', traindata(3, trainclass==3), traindata(4, trainclass==3), 'g+');
hold off

% Function knn
function C = knn(trainclass, traindata, data, k)
    num_classes=range(trainclass)+1;
    num_dim=size(traindata,1);
    distance=zeros(1,length(traindata));
    mins=zeros(k,1);
    c_mins=zeros(k,1);
    
    for i=1:length(traindata)
        for j=1:length(traindata)
            distance(j)=sqrt((data(1,i)-traindata(1,j))^2+(data(2,i)-traindata(2,j))^2+(data(3,i)-traindata(3,j))^2+(data(4,i)-traindata(4,j))^2);
        end
        distance_aux=distance;
        for i=1:k
          [mins(i),idx]=min(distance_aux);
          % Delete smallest value for next iteration
          distance_aux(idx)=[];
        end
        %c_mins(i)=find(trainclass)
    end
    mins'
    C=distance;  
    
    
    % Eucledian distance between data and traindata
%     for i=1:length(traindata)
%         distance(i)=sqrt((data(1,i)-traindata(1,i))^2+(data(2,i)-traindata(2,i))^2+(data(3,i)-traindata(3,i))^2+(data(4,i)-traindata(4,i))^2);
%     end
%     
end
