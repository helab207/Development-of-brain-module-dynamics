function [X,com_A,com_B] = comm_comm_similarity( A, B )
% Inputs, A and B, Row vectors indicating the nodal community affiliations
% Calculating the community-by-community similarity matrix
% X, pair-wise relatioship between modules in A and B
% com_A, labels of modules in A
% com_B, labels of modules in B
% Ref: Steen et al., PRE 84, 016111(2011)

assert(numel(A) == numel(B));
com_A = sort(unique(A));
com_B = sort(unique(B));

NA = numel(com_A);
NB = numel(com_B);

X = zeros(NA,NB);
for ii = 1:NA
    A_ii = (A==com_A(ii));
    for jj = 1:NB
        B_jj = (B==com_B(jj));
        X(ii,jj) = (sum(A_ii.*B_jj))^2/sum(A_ii)/sum(B_jj);
    end
end

end

