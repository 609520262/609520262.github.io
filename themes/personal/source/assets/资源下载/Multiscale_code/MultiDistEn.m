function [MDE]=MultiDistEn(data,m,tau,M,scale)

MDE=[];
data=data';
for j=1:scale
   Xs = Multi(data,j,1);
    [de]=DistEn(Xs',m,tau,M);
    MDE=[MDE,de];
end
end

function M_Data = Multi(data,Scale,flag)
 [m,n]=size(data);      %如果只是向量的话，n=1
for k=1:n
%% Multi-    
if flag==1
    J = fix(m/Scale);
    M_Data=zeros(J,n);
    for i=1:J
        M_Data(i,k) = mean(data((i-1)*Scale+1:i*Scale,k));
    end
elseif flag==2
%% Modified Multi-
    J = m-Scale+1;
     M_Data=zeros(J,n);
     for i=1:J
        M_Data(i,k) = mean(data(i:i + Scale - 1,k));
     end
end   
end
end




function [DE]=DistEn(data,m,tau,M)  % 输入的时间序列为列向量即可

[DE]=distributionEn(data,m,tau,M);    
end

function [de] = distributionEn(x,m,tau,M) 
    N = length(x);
    tempMat =reconstitution(x,m,tau);      % 行数等于嵌入维度，列数等于轨线数量
    dist = [];
    for i=1:(size(tempMat,2)-1)         
        for j=(i+1):size(tempMat,2) 
            dist1(1,j)=Chebyshev_dist(tempMat(:,i)',tempMat(:,j)'); 
        end
        dist = [dist dist1];    % 所有轨线不重复的两两求切比雪夫距离
        dist1 = [];
    end
    mi = min(dist);
    ma = max(dist);
    sub_length = (ma-mi)/M;
    [A ]=histcounts(dist,mi:sub_length:ma);%%分成M个小区间，统计每个小区间的出现频次
    de = -nansum(A/sum(A).*log2(A/sum(A)))/log2(M);  
end

function X = reconstitution(data,m,tau) 
N=length(data);
M=N-m*tau;
    for j=1:M           %% j为轨线数量
        for i=1:m       %% i为第j条轨线上的第i个时间点  每条轨线都有m个点
            X(i,j)=data((i-1)*tau+j);
        end
    end
end

function dist = Chebyshev_dist(a,b)  

dist = max(abs(a-b)); 

end
