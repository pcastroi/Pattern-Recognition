close all; clear all; clc;
%
% Script for loading, reading and visualising data
%

fds = fileDatastore('training_data/*.mat','ReadFcn',@load);

% Read data for training, depends on the percentage that the user inputs
% User input
i=false;
while i==false
	user_trd=input('Value (%) of training data: ');
    if user_trd<=0||user_trd>100
        disp('The (%) value must be more than 0 and less or equal to 100')
    else
        i=true;
    end
end
perc_trd=(size(fds.Files)*user_trd)/100;

trd_all=readall(fds)';
count=1;
for i=0:9
    figure;
    hold on;
    for j=1+i*100:perc_trd(1,1)/10+i*100
        trd(count)=trd_all(:,j);
        
        plot3(trd{count}.pos(:,1),trd{count}.pos(:,2),trd{count}.pos(:,3));
        %view(2);
        count=count+1;
    end
end