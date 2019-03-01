clear all; close all; clc;
% 
% Exercise 13: Question 1
%

load('iris_dataset.mat');
irisInputsTransposed=irisInputs';

% Plot 4D data
figure
plotmatrix(irisInputsTransposed,'.r');

% kmeans, depending on the number of clusters
result1_clusters=kmeans(irisInputsTransposed,1); % empty
result2_clusters=kmeans(irisInputsTransposed,2);
result3_clusters=kmeans(irisInputsTransposed,3);
result4_clusters=kmeans(irisInputsTransposed,4);
result5_clusters=kmeans(irisInputsTransposed,5);
result6_clusters=kmeans(irisInputsTransposed,6);

% Calculate and represent with silhouette
figure
subplot(2,3,1);
silhouette(irisInputsTransposed,result1_clusters);
title('1 Cluster'); % represent only for understanding
subplot(2,3,2);
silhouette(irisInputsTransposed,result2_clusters);
title('2 Clusters');
subplot(2,3,3);
silhouette(irisInputsTransposed,result3_clusters);
title('3 Clusters');
subplot(2,3,4);
silhouette(irisInputsTransposed,result4_clusters);
title('4 Clusters');
subplot(2,3,5);
silhouette(irisInputsTransposed,result5_clusters);
title('5 Clusters');
subplot(2,3,6);
silhouette(irisInputsTransposed,result6_clusters);
title('6 Clusters');