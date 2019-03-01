clear all;close all
%
% Exercise 6: Question 3
%
cvr=[2,0;0,2];
m1=[3;6];
m2=[3;-2];
v1=0:0.01:10; 
n=length(v1);

G1=zeros(n,2);
G2=zeros(n,2);
G12=zeros(n,2);

for i=1:n %Calculating Gi
    G1(i,:)=(((cvr)^(-1)*m1)')*v1(i)-((1/2)*(m1')*(cvr^(-1))*m1);
    G2(i,:)=(((cvr)^(-1)*m2)')*v1(i)-((1/2)*(m2')*(cvr^(-1))*m2);
end

for i=1:n %Calculating the decision boundary
    G12(i,:)=((((cvr)^(-1))*(m1-m2))')*(v1(i)-((1/2)*(m1+m2)));
end
mesh(G12) %Decision boundary plot