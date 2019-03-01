%% Function SVM2
function r = svm2(traindata,trainclass,testdata,C)
    N=length(trainclass);
    Y=zeros(size(trainclass)); % Calculate Y
    for i=1:N
        if trainclass(i)==1
            Y(i)=1;
        else
            Y(i)=-1;
        end
    end
    Y = Y';
    
    H=zeros(N,N); % Calculate H
    for i=1:N
        for j=1:N
            H(i,j)=Y(i)*Y(j)*Kern(traindata(:,i),traindata(:,j));
        end
    end
   
    f=zeros(length(traindata),1); % Calculate f
    for i=1:length(traindata)
        f(i,1)=-1;
    end
    
    % Calculate lambda
    Aeq=Y';
    beq=0;
    LB=zeros(N,1);
    UB=C*ones(N,1);
    A=[];
    b=[];

    lambda=quadprog(H, f, A, b, Aeq, beq, LB, UB);

    % Calculate position of the most significative lambda
    maxi=0;
    pstn=0;
    
    for i=1:length(trainclass)
        if trainclass(i)==1
            if lambda(i)>maxi
                maxi=lambda(i);
                pstn=i;
            end
        end
    end
    
    % Result
    r=zeros(1,N);
    for i=1:N
       a=1;
       for j=1:N
           a=a+(lambda(j)*Y(j)*Kern(traindata(:,j),testdata(:,i))-lambda(j)*Y(j)*Kern(traindata(:,j),traindata(:,pstn)));           
       end
       
       if(a>=0)
           r(i)=1;
       else
           r(i)=2;
       end       
    end 
end