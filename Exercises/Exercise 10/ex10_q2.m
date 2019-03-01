clear all; close all;
%
% Exercise 10: Question 2
%
load('data.mat');
C=5;
[w, w0]=svm(data, class, C);

N = size(data,2);
M1 = numel(find(class==1));
M2 = numel(find(class==2));
data3D_1=zeros(3,M1);
data3D_2=zeros(3,M2);
is1=0;
is2=0;
for k=1:N
    if class(k)==1
        is1=is1+1;
        data3D_1(1,is1)=data(1,k);
        data3D_1(2,is1)=data(2,k);
        z1=-(abs(data(1,k)-data(2,k)).^2);
        z2=(data(1,k)+data(2,k)).^2;
        data3D_1(3,is1)=z1+z2;    
    else
        is2=is2+1;
        data3D_2(1,is2)=data(1,k);
        data3D_2(2,is2)=data(2,k);
        z1=-(abs(data(1,k)-data(2,k)).^2);
        z2=(data(1,k)+data(2,k)).^2;
        data3D_2(3,is2)=z1+z2;
    end
end
figure
hold on
plot3(data3D_1(1,:),data3D_1(2,:),data3D_1(3,:),'bx');
plot3(data3D_2(1,:),data3D_2(2,:),data3D_2(3,:),'ro');
hold off