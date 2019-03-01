clear all;close all;
%
% Exercise 7: Question 1
%
m1=[3;6];
m2=[3;-2];
m3=[11;-2];
s1=[0.5 0;0 2];
s2=[2 0;0 2];
s3=[2 0;0 0.5];

x=-10:0.2:20;
n=length(x);
m=input('Resolution of the contour?(1 to 3 fast) = ');
I=2;
%% Calculate the features with the Multivariate I-dimensional Gaussian pDF equation
% First feature
p_x_1=zeros(n,n);
for i=1:n
    for j=1:n
        p_x_1(i,j)=(1/(((2*pi)^(I/2))*sqrt(det(s1))))*exp(-0.5*([x(i);x(j)]-m1)'*inv(s1)*([x(i);x(j)]-m1));
    end
end
% Second feature
p_x_2=zeros(n,n);
for i=1:n
    for j=1:n
        p_x_2(i,j)=(1/(((2*pi)^(I/2))*sqrt(det(s2))))*exp(-0.5*([x(i);x(j)]-m2)'*inv(s2)*([x(i);x(j)]-m2));
    end
end
% Third feature
p_x_3=zeros(n,n);
for i=1:n
    for j=1:n
        p_x_3(i,j)=(1/(((2*pi)^(I/2))*sqrt(det(s3))))*exp(-0.5*([x(i);x(j)]-m3)'*inv(s3)*([x(i);x(j)]-m3));
    end
end
%% Representations
figure
surf(x,x,p_x_1)
hold on
surf(x,x,p_x_2)
hold on
surf(x,x,p_x_3)
shading interp 
colormap(jet)
colorbar
figure
contour(x,x,p_x_1,n*m)
hold on
contour(x,x,p_x_2,n*m)
hold on
contour(x,x,p_x_3,n*m)
colormap(jet)
colorbar
