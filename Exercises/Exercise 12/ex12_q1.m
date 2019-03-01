clear all; close all; clc;
% 
% Exercise 12: Question 1
%

load('data1.mat');
load('data2.mat');
load('data3.mat');

[testclass1,t1,wHidden1,wOutput1] = mlp(data1,class1,data1,1000000);
[testclass2,t2,wHidden2,wOutput2] = mlp(data2,class2,data2,50000);
[testclass3,t3,wHidden3,wOutput3] = mlp(data3,class3,data3,50000);
disp(testclass1);
disp(testclass2);
disp(testclass3);

function [testclass, t, wHidden, wOutput] = mlp(traindata, trainclass, testdata, maxEpochs)
% Template for implementing a simple multilayer perceptron

N = size(traindata, 2);
d = size(traindata, 1);
classes = max(trainclass);

if ~exist('maxEpochs', 'var')
  maxEpochs = 100000;
end

% Initialisation
J=0;
rho = 0.0001;
hidden = N+1; % number of hidden layer neurons

trainOutput = zeros(classes, N);
for i = 1:N
  trainOutput(trainclass(i), i) = 1;
end

extendedInput = [traindata; ones(1, N)];
wHidden = (rand(d+1, hidden)-0.5)/10;
wOutput = (rand(hidden+1, classes)-0.5)/10;

% Iterative learning
fh1 = figure;
t = 0;
while 1
  t = t+1;
  
  vHidden = wHidden'*extendedInput;
  yHidden = tanh(vHidden);

  yHidden = [yHidden; ones(1, N)];

  vOutput = wOutput'*yHidden;
  yOutput = vOutput;
    
  J(t) = 0.5*(norm(trainOutput-yOutput)^2);

  if (mod(t, 1000) == 0) % Plot convergence, but not for every epoch
    semilogy(1:t, J(1:t));
    title(sprintf('Convergence (epoch %d)', t));
    drawnow;
  end
  
  if (trainOutput-yOutput)<0.45  % the learning is good enough
    break;
  end;
  
  if t>maxEpochs % too many epochs would be done
    break;
  end
  
  if t > 1 % this is not the first epoch
    if deltawOutput>10e-4 % the improvement is small enough
      break;
    end
  end
 
  deltaOutput = (yOutput-trainOutput);
  deltaHidden = (wOutput(1:end-1, :)*deltaOutput).*(1-yHidden(1:end-1, :).^2);
  
  deltawHidden = -rho*extendedInput*deltaHidden';
  deltawOutput = -rho*yHidden*deltaOutput';
  
  wOutput = wOutput+deltawOutput;
  wHidden = wHidden+deltawHidden;
end

% Testing
N = size(testdata, 2);
extendedInput = [testdata;ones(1, N)];

vHidden = wHidden'*extendedInput;
yHidden = tanh(vHidden);

yHidden = [yHidden; ones(1, N)];

vOutput = wOutput'*yHidden;
yOutput = vOutput;

[tmp, testclass] = max(yOutput, [], 1);
end