figure('Name','Non-Normalized data','NumberTitle','off');
subplot(1,3,1)
plot(Dis1(:,1),Dis1(:,2),'.')
hold on 
vectarrow(mu,[mu(1)+evc1(1,1) mu(2)+evc1(2,1)])
hold on 
vectarrow(mu,[mu(1)+evc1(1,2) mu(2)+evc1(2,2)])
title('Equal variance, no covariance')
subplot(1,3,2)
plot(Dis2(:,1),Dis2(:,2),'.')
hold on 
vectarrow(mu,[mu(1)+evc2(1,1) mu(2)+evc2(2,1)])
hold on 
vectarrow(mu,[mu(1)+evc2(1,2) mu(2)+evc2(2,2)])
title('Non-equal variance, no covariance')
subplot(1,3,3)
plot(Dis3(:,1),Dis3(:,2),'.')
hold on 
vectarrow(mu,[mu(1)+evc3(1,1) mu(2)+evc3(2,1)])
hold on 
vectarrow(mu,[mu(1)+evc3(1,2) mu(2)+evc3(2,2)])
title('Non-equal variance, covariance')