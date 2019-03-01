function [mu, Sigma, P] = em_gmm(data, J)
%EM_GMM Gaussian mixture modelling by using expectation maximisation
%
% Output:
%   mu - means of the mixture components.
%   Sigma - covariances of the mixture components.
%   P - probabilities (mixing parameters) of the mixture components.
% Input:
%   data - dataset to be modelled.
%   J - number of the mixture components.

% Initialisation
N = size(data, 2);
l = size(data, 1);

mu = zeros(l, J); % mixture component means
Sigma = zeros(l, l, J); % mixture component covariances
P = repmat(1/J, J, 1); % mixture component probabilities (mixing parameter)

% Initialize the mixture with mean (with noise) and covariance
for i = 1:J
  mu(:, i) = mean(data, 2) + rand(l, 1);
  Sigma(:, :, i) = cov(data');
end
origmu = mu;
iterInd = 1;

% Start visualising the data
...

% Estimate the parameters
while true % iterate forever (till the end criterion is met)
  % Pre-allocate the next values
  newmu = zeros(l, J);
  newP = zeros(J, 1);
  newSigma = zeros(l, l, J);

  for j = 1:J % for all mixture components
    % Update the mean
    ...
    newmu(:, j) = ...

    % Update the covariance
    ...
    newSigma(:, :, j) = ...
  
    % Update the probability for the mixture
    newP(j) = ...
    
    % Update the visualisation
    ...
    drawnow
  end

  % Are the means moving: is it time to end the iteration?
  if norm(mu - newmu) < 0.01
    break
  end

  % Update the variables for the next iteration
  mu = newmu;
  Sigma = newSigma;
  P = newP;
  iterInd = iterInd + 1;
end
% Visualise the final result
...

end

function r = pjxk(j, xk, mu, Sigma, P, J)
% Helper function for determining p(j|\mathbf{x}_k; \Theta(t))
...
end

function q = pxk(xk, muj, Sigmaj)
% Helper function for determining p(j|\mathbf{x}_k; \Theta(t))
...
end
