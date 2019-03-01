function C = digit_classify(Data, trainClass, SS, extDim)

%Settings
if ~exist('SS','var')
    SS = 12;
end

if ~exist('extDim','var')
    extDim = 1;
end

if exist('trainClass','var')
   
    digits=10;   
    gaModel = cell(digits,2);

%Build models
    X = Data{1};
    temp = preprocess(X,extDim,SS);
    dim = size(temp,1);
    
for d=1:digits
%Sellect for samples of only one class
    idxVec = find(trainClass==d);
    sign = sum(trainClass==d);
    slice = zeros(sign,dim,SS);
    
    %Construct 3 dim array which can be sliced easily
    for sig=1:sign
        X = Data{idxVec(sig)};          
        X = preprocess(X,extDim,SS);
        slice(sig,:,:)=X;
    end
    
    mu = zeros(dim,SS);
    si = zeros(dim,dim,SS);
    
    for x=1:SS
        mu(:,x)=mean(slice(:,:,x),1)';
        si(:,:,x)=cov(slice(:,:,x));
    end

    gaModel{d,1}=mu;
    gaModel{d,2}=si; 
    C=0;
end
    save('gaModel.mat','gaModel','SS','extDim');
else
    if ~exist('gaModel','var')
        load('gaModel.mat');
    end
    
    Data = preprocess(Data,extDim,SS);

    lmtrx = bayesDtw(gaModel, Data);
    [score,C] = likeMatClassify(lmtrx,1);

    score;
end