function [Train_cell_Data,Test_cell_Data,Train_Class,Test_Class]=function_preprocess(train_proportion,sample_rate);


% 
% train_proportion=0.7;
% sample_rate=600;


%First we want to have all of the data in one Array
Data_Files=dir(fullfile('.\training_data','*.mat'));
Array = {};
[n_files,m_files] = size(Data_Files);
for i=1:n_files
    a = Data_Files(i,1);
    load(fullfile('.\training_data',a.name));
    Array{i}=pos;
end

%Some of the train sets was noisy, So we dicided to remove them
noises=[ 33 100 103 107 114 121 122 133 138 146 162 164 167 168 169 171 ...
         177 178 183 191 192 195 200 279 442 444 446 469 499 593 623 667 677 ...
         694 764 821 836 922 ];
numb=1000-length(noises);
data = zeros(numb, 700);
class = zeros(10, numb);
count = 1;
for i=1:n_files
    call_digit = Array{i};
    categorize = fix((i-1)/100);
    if sum(i==noises)==0
        
        %resampling to 350 
        resampled_Data = resample(call_digit, 400, size(call_digit,1));
        %erasing 12.5% of data in each sample
        %6.25% from beginning and 6.5% from the end
        %because it is human noise(Also some of them were machine noise)
        resampled_Data = resampled_Data(26:375, :);
        data(count, :) = resampled_Data(1:700);
        if categorize==0
            class( 10, count ) = 1;
        else
            class( categorize, count ) = 1;
        end
        count = count+1;
    end
end
data = data';

save('preprocessed_data.mat', 'data', 'class');
% 
% for i=1:10
%     plot(data(1:300,class(i,:)~=0),data(301:600,class(i,:)~=0),'r.')
%     figure
% end

% data_mean=mean(data())

train_counter=1;
test_counter=1;
   for j=1:size(class,1)
        random_maker=randperm(sum(class(j,:)~=0))+min(find(class(j,:)))-1;
        counter=1;
        for num=1:sum(class(j,:)~=0)
            if num<fix(sum(class(j,:)~=0)*train_proportion)
                train_set_Data(:,train_counter)=data(:,random_maker(counter));
                train_set_class(:,train_counter)=class(:,random_maker(counter));
                train_counter=train_counter+1;
            else
                test_set_Data(:,test_counter)=data(:,random_maker(counter));
                test_set_class(:,test_counter)=class(:,random_maker(counter));
                test_counter=test_counter+1;
            end
            counter=counter+1;
        end
   end

   
% for i=1:10
%     plot(train_set_Data(1:300,train_set_class(i,:)~=0),train_set_Data(301:600,train_set_class(i,:)~=0),'r.')
%     figure
% end

Train_data_x = resample(train_set_Data(1:350,:), sample_rate, size(train_set_Data,1)/2);
Train_data_y = resample(train_set_Data(351:700,:), sample_rate, size(train_set_Data,1)/2);

for j=1:9
    Train_Class(find(train_set_class(j,:)))=j+1;
end
    Train_Class(find(train_set_class(10,:)))=1;

Test_data_x = resample(test_set_Data(1:350,:), sample_rate, size(test_set_Data,1)/2);
Test_data_y = resample(test_set_Data(351:700,:), sample_rate, size(test_set_Data,1)/2);

for j=1:9
    Test_Class(find(test_set_class(j,:)))=j+1;
end
    Test_Class(find(test_set_class(10,:)))=1;


% plot(Train_data_x(:,Train_Class==2),Train_data_y(:,Train_Class==2))

for i=1:size(Train_data_x,2)
Train_cell_Data{i}=[Train_data_x(:,i),Train_data_y(:,i)];
end
% 

for i=1:size(Test_data_x,2)
Test_cell_Data{i}=[Test_data_x(:,i),Test_data_y(:,i)];
end

% a=find(Train_Class==1)
% for i=1:size(a,2)
% plot(Train_cell_Data{a(i)}(:,1),Train_cell_Data{a(i)}(:,2))
% hold on
% end

end



