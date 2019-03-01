function Y = delta(X, normalize)
    len=length(X);
    Y = X;
    Y = X(:,2:len)-X(:,1:len-1);
    Y(:,len) = Y(:,len-1);
    if normalize
        for i=1:len
            Y(:,i)=Y(:,i)./norm(Y(:,i));
        end
    end
end