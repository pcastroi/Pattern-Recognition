function val = likelihoodnd(x, mu, Sigma) %[rows x cols] x[2x1] mu[2x1] Sigma[2x2]
% x can be vector dimensions in collumns
    l = size(mu, 1)/2;
    X = zeros(size(x));
    len = size(x,2);
    dim = size(mu,1);

    for i=1:dim
        X(i,:) = x(i,:)-mu(i);
    end

    val = zeros(1,len);

    C = -0.5*log(det(Sigma));

    for i=1:len
        val(i) = C - 0.5*(((X(:,i))')*(Sigma\(X(:,i))));
    end
end

