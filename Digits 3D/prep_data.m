clear all
close all
clc

train_proportion=0.7;
sample_rate=60;
[Train_cell_Data,Test_cell_Data,Train_Class,Test_Class]=function_preprocess(train_proportion,sample_rate);

a=find(Train_Class==1)
for i=1:size(a,2)
plot(Train_cell_Data{a(i)}(:,1),Train_cell_Data{a(i)}(:,2),'g.')
hold on
end
