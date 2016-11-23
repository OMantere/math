function [Q,R] = my_gsmith(A)
Q = [];
M = [1, 1/2, 1/3, 1/4; 1/2, 1/3, 1/4, 1/5; 1/3, 1/4, 1/5, 1/6; 1/4, 1/5, 1/6, 1/7];
for i=1:size(A,2)
    q = A(:,i);
    for k=1:size(Q,2)
        R(k,i) = q'*M*Q(:,k);
        q = q - R(k,i)*Q(:,k);
    end
    R(i,i) = sqrt(q'*M*q);
    Q(:,i) = q/R(i,i);
end