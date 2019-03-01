clear
close all;

path='training_data/';

%segment 
%SS = 10; %Sig samples max
N = 100; %Number of training signals for each class
%dim = 2; %Dimensionality of data
digits = 10; %idx1 for zero digit

lstIdx = zeros(digits,1);

lstSig = zeros(2); %For maximal length computation

for d = 1:digits
    lstSig = preprocess(sprintf('%sstroke_%d_%04d.mat',path,d-1,1),1,10);
    plotSig(lstSig);
end