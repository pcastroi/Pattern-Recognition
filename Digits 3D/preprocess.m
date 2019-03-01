function X = preprocess(X, extend, undersample)
% Here is the place to work with signals separately
% Also prepares signals for classification
% Can be done PCA, but do not rotate the signals !
% standardization
% dimension extension
% feature selection
% resampling
% noise suppresson somehow

    if ~exist('extend','var')
        extend=0;
    end

    if ~exist('undersample','var')
        undersample=0;
    end

    len = length(X);

    %Possible to do PCA reduction

    %Switch to collumn features
    X = standardize(X(:,[1,2]))';
    if undersample ~= 0
        X = resample(X', undersample, len)';
    end
    
    if extend == 0
        %X = [X(:,1:undersample);delta(X,1)];
    elseif extend == 1
        X = [X(:,1:undersample);delta(X,1)];
    else
        X = delta(X,1);
    end
end


