%means of the classes of the features
m11 = 3;
m12 = 7;
m21 = 5;
m22 = 6;

%STDs of the classes of the features
s11 = 2;
s12 = 1;
s21 = 0.2;
s22 = 0.2;

%Thresholds
X11 = [-15:.1:15];
X12 = [-15:.1:15];
X21 = [2.5:.1:8];
X22 = [2.5:.1:8];

%PDFs
pdf11 = normpdf(X11, m11, s11);
pdf12 = normpdf(X12, m12, s12);
figure(1);
plot(X11, pdf11, X12, pdf12);
meanln1 = (m11 + m12)/2 + 0.3;
hold on
plot([meanln1 meanln1], [0 1]);
hold off
title('Pdfs of the classes of the 1st feature');

pdf21 = normpdf(X21, m21, s21);
pdf22 = normpdf(X22, m22, s22);
figure(2);
plot(X21, pdf21, X22, pdf22);
meanln2 = (m21 + m22)/2;
hold on
plot([meanln2 meanln2], [0 3]);
hold off
title('Pdfs of the classes of the 2nd feature');