function fig = showModel(model,digits,N,dim,SS, dlist)
    fig=figure();
    %hold on;
    for i=dlist
        X = model{i,1};
        %X = zeros(dim,SS);
        %X = (:,:);
        %X = model(i,1,:,:);
        subplot(121);
        plot(X(1,:),X(2,:));
        Y=X(:,2:length(X));
        Y=sqrt(Y(1,:).^2+Y(2,:).^2);
        Z=X(:,1:length(X)-1);
        Z=sqrt(Z(1,:).^2+Z(2,:).^2);
        subplot(122);
        plot(1:SS-1,Y-Z);
        pause(1)
        hold off
    end
    hold off;
end
