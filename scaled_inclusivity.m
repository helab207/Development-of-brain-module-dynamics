function V = scaled_inclusivity(X, ith)
%==========================================================================
% This function is used to calcuate the community assignment consistency of 
% each nodes among various network partitions X
%
% Input:
%         X, M-by-N, M paritions for networks with N nodes, with each row
%         stands for a partition
%         ith, the index of the reference partition

% Ref: Liao NeuroImage (2017); Steen PRE (2011)
% Xuhong Liao, BNU, BeiJing, 2017/4, liaoxuhong@bnu.edu.cn
%==========================================================================

if nargin<2
    error('Please input the reference partition');
end

[M, N] = size(X);
if ith>M
    error('Please input the right index of the reference partition');
end

V = zeros(N,1);            % N, number of nodes

Ref = X(ith,:); 
idx = 1:N;
MQ = sparse(idx, Ref, 1, N, max(Ref), N);

for ii = 1:M
    if (ii~=ith) 
       %disp(['ii = ', num2str(ii)]);
       A = X(ii,:);  
       MA = sparse(idx, A, 1, N, max(A), N);
       
       [S,com_A, com_Ref] = comm_comm_similarity(A, Ref); % pair-wise similarity between modules in A and B
       Ind = find(S);             % find p and q, with S(p,q)>0
       num =length(Ind);
       
       [P, Q] = ind2sub(size(S), Ind); % Pth module in A, Qth module in B
       for jj = 1:num                  % num, number of module pairs with overlapping nodes
           Ind_com = MA(:,com_A(P(jj))).*MQ(:,com_Ref(Q(jj)))>0;
           V(Ind_com) = V(Ind_com) + S(Ind(jj));
       end
    end
end
       
end