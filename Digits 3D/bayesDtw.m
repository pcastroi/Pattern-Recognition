function likeMat = bayesDtw(model, sample, prob)
% Compute matrix of 10xMaxSignalLen values of likelihoods, to eval. resulting class later.
    if ~exist('prob','var')
        prob=0;
    end
    
    F = @likelihoodnd;

    if prob == 1
        F = @gaussnd;
    end

    digits = size(model,1);
    SS = max(size(sample,2),length(model{1,1}(1,:))); %%SS like sample size
    likeMat = zeros(digits,SS);

    for d=1:digits
        %Distance is not used yet, nor will ever be
        %[dist,ix,iy]=dtw(model{d,1},sample); %Might be able delete alltogether
        for i=1:SS %length(ix)
            %likeMat(d,i) = F(sample(:,iy(i)),model{d,1}(:,ix(i)),model{d,2}(:,:,ix(i)));
            likeMat(d,i) = F(sample(:,i),model{d,1}(:,i),model{d,2}(:,:,i));
        end
    end
end