clear all;close all
sgma=1; %Standard deviation
m=[3,6];%Mean
x=0:0.01:9.5;
t=length(x); %number of samples
P_w=[2/3 1/3];
 
%% Calculating P(x|wi)
P_x_w=zeros(2,t);
for i=1:2
    for j=1:t
        P_x_w(i,j)=(1/(sqrt(2*pi)*sgma))*exp(-0.5*((x(j)-m(i))/sgma)^2);
    end
end
 
%% Question 3, P_W_1 = P_W_2
 
P_x=zeros(2,t);
for i=1:2
    for j=1:t
        aux=0;
        for k=1:2
            aux=aux+(P_x_w(k,j)*0.5);
        end
        P_x(i,j)=aux;
    end
end
for i=1:2
    for j=1:t
        P_w_x(i,j)=(P_x_w(i,j)*0.5)/P_x(i,j);
    end
end
 
P_e_x=zeros(1,t);
for j=1:t
    P_e_x(j)=min(P_w_x(:,j));
end
%% Plotting Q3
D_Bnd=[sum(m)/2 sum(m)/2];
figure
subplot(2,1,1)
plot(x,P_x_w(1,:))
hold on
plot(x,P_x_w(2,:))
hold on
plot(D_Bnd,[0 0.4])
title('Normal distribution') 
subplot(2,1,2)
plot(x,P_e_x)
title('Question 3 Error') 
%% Classifier Q3
disp('Question 3')
X=input('Boundary for the minimum-error classifier: ');
for i=1:t
    if X==x(i)
        K=i;
    end
end
if X<D_Bnd
    disp('Class 1, P_e: ')
    Error=P_e_x(K)
else
    disp('Class 2, P_e: ')
    Error=P_e_x(K)
end
 
 
%% Question 4, P_W_1 =/ P_W_2
P_x=zeros(2,t);
for i=1:2
    for j=1:t
        aux=0;
        for k=1:2
            aux=aux+(P_x_w(k,j)*P_w(k));
        end
        P_x(i,j)=aux;
    end
end
 
for i=1:2
    for j=1:t
        P_w_x2(i,j)=(P_x_w(i,j)*P_w(i))/P_x(i,j);
    end
end
 
P_e_x2=zeros(1,t);
for j=1:t
    P_e_x2(j)=min(P_w_x2(:,j));
end
%% Plotting Q4
D_Bnd=[sum(m)/2 sum(m)/2];
figure
subplot(2,1,1)
plot(x,P_x_w(1,:))
hold on
plot(x,P_x_w(2,:))
hold on
plot(D_Bnd,[0 0.4])
title('Normal distribution') 
subplot(2,1,2)
plot(x,P_e_x2)
title('Question 4 Error') 
%% Classifier Q4
disp('Question 4')
X=input('Boundary for the minimum-error classifier: ');
for i=1:t
    if X==x(i)
        K=i;
    end
end
if X<D_Bnd
    disp('Class 1, P_e: ')
    ERROR=P_e_x(K)
else
    disp('Class 2, P_e: ')
    ERROR=P_e_x(K)
end