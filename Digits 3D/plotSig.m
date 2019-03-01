function plotSig(X)
    dim=size(X,1);
    range=2:3;
    if dim==4
        range=2;
    end
    %figure;
    subplot(311)
    hold on;
    plot(X(1,:),'r-');
    plot(X(2,:),'b-');
    subplot(3,1,range)
    plot(X(1,:),X(2,:),'g');
    if dim==4
        subplot(3,1,3)
        plot(X(3,:),X(4,:),'k-');
    end
end