function h = plotclass(mus, Sigmas, p)
% PLOTCLASS plots classes as ellipses or ellipsoids
%
% plotclass(mus, Sigmas, p)
%
% h = handles for the ellipsoids
% mus = 2D array of means
% Sigmas = 3D array of covariances
% p = probability threshold (confidence level)
%
% Lasse Lensu, 2017-10-08
%
% See also plot_gaussian_ellipsoid.

l = size(mus, 1); % number of dimensions
if ~exist('p', 'var') % set default probability threshold
  p = 0.95;
end
stdThres = sqrt(chi2inv(p, size(mus, 1)));

% color = ['r', 'g', 'b', 'c', 'm', 'y', 'k'];

for classInd = 1:size(Sigmas, 3)
%   plot(Sigma(1, 1, classInd) * cos(phi) + Sigma(1, 2, classInd) * sin(phi) + mu(1, classInd), ...
%     Sigma(2, 1, classInd) * cos(phi) + Sigma(2, 2, classInd) * sin(phi) + mu(2, classInd), ...
%     color(mod(classInd - 1, 7) + 1));
  mu = mus(:, classInd);
  Sigma = Sigmas(:, :, classInd);
  h(classInd) = plot_gaussian_ellipsoid(mu, Sigma, stdThres);
  
  [V, D] = eig(Sigma); 
  D = sqrt(diag(D));
  switch(l)
    case 2
      for i = 1:2
        quiver(mu(1), mu(2), ...
          V(1, i) * D(i), V(2, i) * D(i), ...
          'Color', 'k', 'LineWidth', 3);
      end
    case 3
      set(h,'facealpha',0.5);
      for i = 1:3
        quiver3(mu(1), mu(2), mu(3), ...
          V(1, i) * D(i), V(2, i) * D(i), V(3, i) * D(i), ...
          'Color', 'k', 'LineWidth', 3);
      end
    otherwise
      error('Unsupported dimensionality');
  end
  axis equal; grid on;
end
