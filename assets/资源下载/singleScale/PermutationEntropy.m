function [apen] = PermutationEntropy(data,m,t)
%  Calculate the permutation entropy
%  Input:   
%           data: time series;
%           m: order of permuation entropy
%           t: delay time of permuation entropy, 
%  Output:  
%           apen: permuation entropy
%Ref: G Ouyang, J Li, X Liu, X Li, Dynamic Characteristics of Absence EEG Recordings with Multiscale Permutation %  
%                             Entropy Analysis, Epilepsy Research, doi: 10.1016/j.eplepsyres.2012.11.003
%     X Li, G Ouyang, D Richards, Predictability analysis of absence seizures with permutation entropy, Epilepsy %  
%                            Research,  Vol. 77pp. 70-74, 2007
ly = length(data);
permlist = perms(1:m); %%%%先构建排列的模板
c(1:length(permlist))=0;
    
 for i=1:ly-t*(m-1)
     [~,iv]=sort(data(i:t:i+t*(m-1)));  %%%把相空间的排列写出来
     for jj=1:length(permlist)
         if (abs(permlist(jj,:)-iv))==0 %%%%比对相空间与模板
             c(jj) = c(jj) + 1 ;
         end
     end
 end

hist = c; 
c=hist(find(hist~=0));
p = c/sum(c);
pe = -sum(p .* log(p));
% normalized
apen=pe/log(factorial(m));
end