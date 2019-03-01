function C = knn(trainclass, traindata, data, k)

   cls = unique(trainclass);
   
   % Set dimensions
   I = length(cls);
   N = size(traindata,2);
   X = size(data,2);
   %dim = size(data,1);
   
   C = zeros(1,size(data,2));
      
   % each data point individually
   for x=1:X
       dst = zeros(2,N);
        % calculate the distances, and mark them with class number of
        % training point
       for n=1:N
           dst(:,n) = [norm(data(:,x)-traindata(:,n));trainclass(n)];
       end
       
       % classify and decrease k if ambiguous
       ambiguity = 0;
       while true
           
       mask = ones(1,N);
       clCount = zeros(1,I);
       
       % count classes of k-amb nearest neighbors 
       for j=1:(k-ambiguity)
                [~,idx] = min(dst(1,mask==1),[],2); %index of minimum distance
                %Add points to that particular class
                clCount(dst(2,idx)) = clCount(1,dst(2,idx))+1;
                % exclude already found minmums
                mask(idx) = 0;
       end
       % find the class with most occurence
       [val,idx] = max(clCount,[],2); %index and value of maximum number in class counter
       % if ambiguous decrease k until ok
       if (sum(clCount==val))>1 %reclassify if more than one maximum in class counter
           ambiguity = ambiguity+1;
       else
           % classify data point
           C(x)=idx;
           break;
       end
       end
   end
   
   
   