%% Function SVM
function [w,w0] = svm(traindata,trainclass,C)
    N=length(trainclass);
    Y=zeros(size(trainclass)); % Calculate Y
    for i=1:length(trainclass)
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
            H(i,j)=Y(i)*Y(j)*traindata(:,i)'*traindata(:,j);
        end
    end
   
    f=zeros(length(traindata),1); %Calculate f
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
    sol=[0;0];
    for i=1:N
        sol=sol+(lambda(i)*Y(i)*traindata(:,i));
    end
    
    thr=0.1; % Threshold for lambda values
    pstn=0; % Position of lambda
    
    for i=1:N
        if trainclass(i)==1
            if lambda(i)>thr
                pstn=i;
            end
        end
    end
    
    %% Plot
    x_k=traindata(:,pstn);
    sol_0=1-x_k'*sol;
    w=sol;
    w0=sol_0;
    xmax = max(traindata(1, :)) + 1;
    xmin = min(traindata(1, :)) - 1;
    ymax = max(traindata(2, :)) + 1;
    ymin = min(traindata(2, :)) - 1;
    figure
    hold off;
    plot(traindata(1, trainclass == 1), traindata(2, trainclass == 1), 'bx', traindata(1, trainclass == 2), traindata(2, trainclass == 2), 'ro');
    axis([xmin xmax ymin ymax]);
    hold on;
    line([xmin xmax], [-(w(1) * xmin + w0) / w(2), -(w(1) * xmax + w0) / w(2)]);  
end