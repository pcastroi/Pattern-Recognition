clear all;close all
%
% Exercise 6: Questions 1 and 2
%
s=[1 1]; % Standard deviation
m=[3 6];% Means of the STDs
x=0:0.01:9.6; % Measure
n=length(x); 
p_w=[2/3 1/3]; % P(w1), P(w2)

% P(x|wi)
p_x_w=zeros(2,n);
for i=1:2
    for j=1:n
        p_x_w(i,j)=(1/(sqrt(2*pi)*s(i)))*exp(-0.5*((x(j)-m(i))/s(i))^2); 
    end
end

%% P(w1) = P(w2) -> Equal a priori probabilities; P(error|x)=min{P(w1|x),P(w2|x))
p_x=zeros(2,n);
for i=1:2
    for j=1:n
        q=0;
        for k=1:2
            q=q+(p_x_w(k,j)*0.5);
        end
        p_x(i,j)=q;
    end
end
for i=1:2
    for j=1:n
        p_w_x(i,j)=(p_x_w(i,j)*0.5)/p_x(i,j);
    end
end

% P(error|x1)
p_error_x=zeros(1,n);
for j=1:n
    p_error_x(j)=min(p_w_x(:,j));
end

% Decision boundary
for j=1:n
    if (log(p_w_x(1,j))-log(p_w_x(2,j)))<=0.01 && (log(p_w_x(1,j))-log(p_w_x(2,j)))>=-0.01
        db_i=j; 
    end
end
db=x(db_i);

% Classifier
disp('Question 1')
disp('The decision boundary is: ')
disp(db)
X1=input('Input measure: ');
for i=1:n
    if X1==x(i)
        G1=i;
    end
end
if X1<db
    disp('The measure belongs to class 1, P(error|x): ')
    disp(p_error_x(G1))
else
    disp('The measure belongs to class 2, P(error|x): ')
    disp(p_error_x(G1))
end

% Plotting
figure
subplot(2,1,1)
plot(x,p_w_x(1,:))
hold on
plot(x,p_w_x(2,:))
hold on
plot([db db],[0 1])
xlabel('x')
ylabel('P')
legend('P(w1)','P(w2)','Decision boundary')
subplot(2,1,2)
plot(x,p_error_x)
title('P(error|x) with equal probability')
xlabel('Measure')
ylabel('P')
%% P(w1) =! P(w2) -> Non-equal a priori probabilities; P(error|x2)=min{P(w1|x2),P(w2|x2))
p_x=zeros(2,n);
for i=1:2
    for j=1:n
        q=0;
        for k=1:2
            q=q+(p_x_w(k,j)*p_w(k));
        end
        p_x(i,j)=q;
    end
end

for i=1:2
    for j=1:n
        p_w_x2(i,j)=(p_x_w(i,j)*p_w(i))/p_x(i,j);
    end
end

% P(error|x2)
p_error_x2=zeros(1,n);
for j=1:n
    p_error_x2(j)=min(p_w_x2(:,j));
end

% Decision boundary
for j=1:n
    if (log(p_w_x2(1,j))-log(p_w_x2(2,j)))<=0.01 && (log(p_w_x2(1,j))-log(p_w_x2(2,j)))>=-0.01
        db2_i=j; 
    end
end
db2=x(db2_i);

% Classifier
disp('Question 2')
disp('The decision boundary is: ')
disp(db2)
X2=input('Input measure: ');
for i=1:n
    if X2==x(i)
        G2=i;
    end
end
if X2<db2
    disp('The measure belongs to class 1, P(error|x): ')
    disp(p_error_x2(G2))
else
    disp('The measure belongs to class 2, P(error|x): ')
    disp(p_error_x2(G2))
end

% Plotting
figure
subplot(2,1,1)
plot(x,p_w_x2(1,:))
hold on
plot(x,p_w_x2(2,:))
hold on
plot([db2 db2],[0 1])
xlabel('x')
ylabel('P')
legend('P(w1)','P(w2)','Decision boundary')
subplot(2,1,2)
plot(x,p_error_x2)
title('P(error|x) with non equal probability')
xlabel('Measure')
ylabel('P')