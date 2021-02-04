function [V_wei] = scaled_inclusivity_wei(X)
%==========================================================================
% This function is used to calculate regional modular variability
% Input:
%       X:
%               M-by-N, M partitions for network of N nodes
% Output:
%       V_wei:
%               The results of regional modular variability.

% Ref: Liao NeuroImage (2017); Steen PRE (2011)
% Xuhong Liao, BNU, BeiJing, 2017/4, liaoxuhong@bnu.edu.cn
%==========================================================================

[M, N] = size(X);   % M, partitions, and N nodes

% Step1, partition similarity among different partitions
J = zeros(M);     % similarity among M partitions

for ii = 1:M
    for jj = ii+1:M
        J(ii,jj) = ami(X(ii,:), X(jj,:));      % adjusted mutual information, Liao 20161009
        %J(ii,jj) = AMI_T(X(ii,:)', X(jj,:)');      % adjusted mutual information, Liao 20161009
    end
end

J = J+J';
Deg_J = sum(J,2);
Deg_J = Deg_J/sum(Deg_J);             % sum(Deg) =1

% Step2, calculate the scaled vector for each given ref partition
V_wei = zeros(N,1);
V_vec = zeros(N,M);
for ith = 1:M
    V = scaled_inclusivity(X, ith);
    V_wei = V_wei + V*Deg_J(ith);
    V_vec(:,ith) = V;
end

V_wei = 1-V_wei/(M-1);      % Normalize the variability, and chaged to modular variability
end

