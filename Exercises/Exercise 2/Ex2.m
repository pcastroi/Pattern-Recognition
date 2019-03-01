A=1:10; %works only for vectors
S=0;
for i=1:length(A) %Summatory
  S=S+A(i);
end
M=S/length(A); %Mean
x=0;
for i=1:length(A)
    x=x+(A(i)-M)^2;
end
Var=x/length(A); %Variance
