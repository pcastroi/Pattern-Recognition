clear all; close all; clc;
% 
% Exercise 12: Question 4
%

ref=[0,0];

x=-100:0.01:100;
y=-100:0.01:100;

Manhattan_aux_x=zeros(size(x));
Manhattan_aux_y=zeros(size(y));

d_val=4;

c_1=1;
c_2=1;

for i=1:length(x)
    for j=1:length(y)
        if (Manhattan(ref,[x(i),y(j)],2) == d_val)
            Manhattan_aux_x(c_1)=x(i);
            Manhattan_aux_y(c_2)=y(j);
            c_1=c_1+1;
            c_2=c_2+1;
        end
    end
end

Manhattan_x=zeros(1,c_1-1);
Manhattan_y=zeros(1,c_2-1);

for i=1:c_1-1
    Manhattan_x(i)=Manhattan_aux_x(i);
end

for i=1:c_2-1
    Manhattan_y(i)=Manhattan_aux_y(i);
end

figure
hold on;
plot(ref(1),ref(2), 'kx', Manhattan_x, Manhattan_y, 'b.');
title('Manhattan distance´s equidistant curve(d=4)');

Euclidean_aux_x=zeros(size(x));
Euclidean_aux_y=zeros(size(y));

c_1=1;
c_2=1;

for i=1:length(x)
    for j=1:length(y)
        if (Euclidean(ref,[x(i),y(j)],2) == d_val)
            Euclidean_aux_x(c_1)=x(i);
            Euclidean_aux_y(c_2)=y(j);
            c_1=c_1+1;
            c_2=c_2+1;
        end
    end
end

Euclidean_x=zeros(1,c_1-1);
Euclidean_y=zeros(1,c_2-1);

for i=1:c_1-1
    Euclidean_x(i)=Euclidean_aux_x(i);
end

for i=1:c_2-1
    Euclidean_y(i)=Euclidean_aux_y(i);
end


figure
hold on;
plot(ref(1),ref(2), 'kx', Euclidean_x, Euclidean_y, 'b.');
title('Euclidean distance´s equidistant curve(d=4)');

MaxNorm_aux_x=zeros(size(x));
MaxNorm_aux_y=zeros(size(y));

c_1=1;
c_2=1;

for i=1:length(x)
    for j=1:length(y)
        if (MaxNorm(ref,[x(i),y(j)],2) == d_val)
            MaxNorm_aux_x(c_1)=x(i);
            MaxNorm_aux_y(c_2)=y(j);
            c_1=c_1+1;
            c_2=c_2+1;
        end
    end
end

MaxNorm_x=zeros(1,c_1-1);
MaxNorm_y=zeros(1,c_2-1);

for i=1:c_1-1
    MaxNorm_x(i)=MaxNorm_aux_x(i);
end

for i=1:c_2-1
    MaxNorm_y(i)=MaxNorm_aux_y(i);
end
      
figure
hold on;
plot(ref(1),ref(2), 'kx', MaxNorm_x, MaxNorm_y, 'b.');
title('MaxNorm distance´s equidistant curve(d=4)');

%% Functions for calculating the distances(d=4 default) for the representation of the equidistant curve
function d = Manhattan(v_1,v_2,dim)
    d=0;
    for i=1:dim
        d = d + abs(v_1(i)-v_2(i));
    end
end

function d = Euclidean(v_1,v_2,dim)
    d=0;
    for i=1:dim
        d = d + (v_1(i)-v_2(i))^2;
    end
    d = sqrt(d);
end

function d = MaxNorm(v_1,v_2,dim)
    aux=zeros(1,dim);
    for i=1:dim
        aux(i)=abs(v_1(i)-v_2(i));
    end
    d = max(aux);
end