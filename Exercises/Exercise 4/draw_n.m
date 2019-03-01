figure('Name','Normalized data','NumberTitle','off');
subplot(1,3,1)
plot(Dis1_N(:,1),Dis1_N(:,2),'.')
hold on 
vectarrow([0 0],[evc1_N(1,1) evc1_N(2,1)])
hold on 
vectarrow([0 0],[evc1_N(1,2) evc1_N(2,2)])
title('Equal variance, no covariance')
subplot(1,3,2)
plot(Dis2_N(:,1),Dis2_N(:,2),'.')
hold on 
vectarrow([0 0],[evc2_N(1,1) evc2_N(2,1)])
hold on 
vectarrow([0 0],[evc2_N(1,2) evc2_N(2,2)])
title('Non-equal variance, no covariance')
subplot(1,3,3)
plot(Dis3_N(:,1),Dis3_N(:,2),'.')
hold on 
vectarrow([0 0],[evc3_N(1,1) evc3_N(2,1)])
hold on 
vectarrow([0 0],[evc3_N(1,2) evc3_N(2,2)])
title('Non-equal variance, covariance')