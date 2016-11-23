W=[1 2 1 0; 1 1 2 1].';
V=null([2 1 1 0; 1 1 1 1]);

Q=W*inv(W.'*W)*W.'
P=W*inv(V.'*W)*V.'

Q^2-Q
P^2-P
Q.'*(eye(4)-Q)