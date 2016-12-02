A = [1 1; 1 0];
[X, V] = eig(A);
x2 = [1; 1];

arvot = [10, 20, 30];
for a=arvot;
    F = X * V^(a-2)*X^(-1)*x2;
    F(1)
end