function [score, c] = likeMatClassify(likeMat, method)
% Classify, with given method, results of time series of likelihood of sample signal
%against models for each digit
% score - maximum metric value that was selected
% c - resulting class

    len=size(likeMat,2);
    dim=size(likeMat,1);

    if ~exist('method','var') || method == 0 %maximum of sum of likelihoods across time
        [score, c] = max(sum(likeMat,2),[],1);

    elseif method == 1 %probabillistic approach, bayes theorem, max probabillity at each time point,
        evidence = sum(likeMat,1);
        postProb = likeMat;
        for col=1:len
            postProb(:,col) = likeMat(:,col)./evidence(col);
        end
        [score, c] = max(sum(likeMat,2)./len,[],1);
    else                %most frequent class from historgam of class decisions across time
        [~, classVec] = max(likeMat,[],1);
        cHist = histcounts(classVec, 1:dim);
        [score, c] = max(cHist, [], 2);
        %fix and pick one
        c = find(cHist==score)

    end
end