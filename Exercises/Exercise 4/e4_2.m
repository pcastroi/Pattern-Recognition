close all;clear all
n=100; % Number of points
s1=[0.4 0;0 0.4]; % Equal variance, no covariance
s2=[0.9 0;0 0.9]; % Non-equal variance, no covariance
s3=[0.3 0.2;0.2 0.3]; % Non-equal variance, covariance
mu=[0,0]; % Means

%% Distributions 
Dis1=mvnrnd(mu,s1,n);
Dis2=mvnrnd(mu,s2,n);
Dis3=mvnrnd(mu,s3,n);

%% Normalization of the values
Dis1_N=zeros(n,2);
Dis2_N=zeros(n,2);
Dis3_N=zeros(n,2);
for i=1:n
    for j=1:2
    Dis1_N(i,j)=(Dis1(i,j)-mu(j))/sqrt(s1(j,j));
    Dis2_N(i,j)=(Dis2(i,j)-mu(j))/sqrt(s2(j,j));
    Dis3_N(i,j)=(Dis3(i,j)-mu(j))/sqrt(s3(j,j));
    end
end

s1_N=cov(Dis1_N);
s2_N=cov(Dis2_N);
s3_N=cov(Dis3_N);

%% Eigen-vectors and Eigen-values of non-normalization data:
[evc1,evs1]=eig(s1);
[evc2,evs2]=eig(s2);
[evc3,evs3]=eig(s3);

draw_nn

%% Eigenvectors and Eigenvalues of normalization data:
[evc1_N,evs1_N]=eig(s1_N);
[evc2_N,evs2_N]=eig(s2_N);
[evc3_N,evs3_N]=eig(s3_N);

draw_n

%% Values of the matrices:
disp('Covariance matrix on non-normalization: ')
s1
s2
s3
disp('Covariance matrix on normalization: ')
s1_N
s2_N
s3_N