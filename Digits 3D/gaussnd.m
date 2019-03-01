function val = gaussnd(x, mu, Sigma) %[rows x cols] x[2x1] m1[2x1] eps[2x2]
% x can be vector dimensions in collumns
    l = size(mu, 1)/2;
    X = zeros(size(x));
    len = size(x,2);
    dim = size(mu,1);

    for i=1:dim
        X(i,:) = x(i,:)-mu(i);
    end

    val = zeros(1,len);

    C = 1/((2*pi)^l*det(Sigma)^0.5);

    for i=1:len
        val(i) = C * exp(-0.5*(((X(:,i))')*(Sigma\(X(:,i)))));
    end
end
