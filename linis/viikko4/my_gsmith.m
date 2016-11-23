function [Q,R] = my_gsmith(A)
Q = [];
for i=1:size(A,2);
  q = A(:,i);
  for k=1:size(Q,2);
    R(k,i) = q'*Q(:,k);
    q = q - R(k,i)*Q(:,k);
  end
  R(i,i) = norm(q);
  Q(:,i) = q/R(i,i);
end
