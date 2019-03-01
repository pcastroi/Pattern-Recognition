function [testclass, t, wHidden, wOutput] = ...
  mlp(traindata, trainclass, testdata, maxEpochs)
% Template for implementing a simple multilayer perceptron

N = size(traindata, 2);
d = size(traindata, 1);
classes = max(trainclass);

if ~exist('maxEpochs', 'var')
  maxEpochs = 100000;
end

% Initialisation
J = ...;

rho = 0.0001;

hidden = ...; % number of hidden layer neurons

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
    
  J(t) = ...;

  if (mod(t, 1000) == 0) % Plot convergence, but not for every epoch
    semilogy(1:t, J(1:t));
    title(sprintf('Convergence (epoch %d)', t));
    drawnow;
  end
  
  if ... % the learning is good enough
    break;
  end;
  
  if ... % too many epochs would be done
    break;
  end
  
  if t > 1 % this is not the first epoch
    if ... % the improvement is small enough
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
