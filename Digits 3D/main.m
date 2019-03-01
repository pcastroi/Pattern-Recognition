% Here run test of classifier and print results, experiments separated into
%sections
%% Display some signals
clear all
close all
clc

train_proportion=0.5;
sample_rate=64;

[train_data,test_data,train_class,test_class]=function_preprocess(train_proportion,sample_rate);

figure
for d = 1:10
    a=find(test_class==d);
    subplot(3,4,d);
    for i=1:size(a,2)
        plot(test_data{a(i)}(:,1),test_data{a(i)}(:,2),'.')
        hold on
    end
end

figure
for d = 1:10
    a=find(test_class==d);
    subplot(3,4,d);
    for i=1:size(a,2)
        X = preprocess(test_data{a(i)},0,10);
        plot(X(1,:),X(2,:),'-')
        hold on
    end
end

figure
for d = 1:10
    a=find(test_class==d);
    subplot(3,4,d);
    for i=1:size(a,2)
        X = preprocess(test_data{a(i)},2,10);
        plot(X(1,:),X(2,:),'-')
        hold on
    end
end

%% Simple test
clc;
clear;
close all;

train_proportion=0.5;
sample_rate=100; %Can be same as 3rd param
[train_data,test_data,train_class,test_class]=function_preprocess(train_proportion,sample_rate);

digit_classify(train_data, train_class, 24, 1); % plug in optimum for details

result=test_class;

sumCorr=0;
for i=1:length(test_class)
    C=digit_classify(test_data{i});
    result(i)=C;
    if test_class(i)==C
        sumCorr = sumCorr+1;
    end
end

histogram(result);
confusionmat(test_class,result)
sumCorr/(length(test_class))

%% Sweep test, search for optimum parameters
clc;
clear;
close all;

train_proportion=0.5;
sample_rate=64; %Can be same as 3rd param
[train_data,test_data,train_class,test_class]=function_preprocess(train_proportion,sample_rate);

dim=[0:2];
%dim=1;
%para=floor((1.6).^[2:10])+6;
para=[8:8:sample_rate];

perf = zeros(length(para), length(dim));
%stats = cells();
for d=1:length(dim)
    for p=1:length(para)
        digit_classify(train_data, train_class, para(p), dim(d));

        result=test_class;

        sumCorr=0;
        for i=1:length(test_class)
            C=digit_classify(test_data{i});
            result(i)=C;
            if test_class(i)==C
                sumCorr = sumCorr+1;
            end
        end

        %histogram(result);
        %confusionmat(test_class,result)
        perf(p,d)=sumCorr/(length(test_class));
    end
end

figure
plot(para,perf(:,1));
hold on
plot(para,perf(:,2));
plot(para,perf(:,3));
legend('XY','XY & delta norm','delta norm');

[val,idx]=max(perf,[],1);
[performance,idx2]=max(val,[],2);

para(idx(idx2))
dim(idx2)
