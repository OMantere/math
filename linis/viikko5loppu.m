A = [2 1 0; 1 2 1; 0 1 2];
x = [1; 1; 1];
e = [];
E = eig(A);
lambda = E(3);
for i=1:10;
    xi = x(:, i);
    mu = xi'*A*xi/norm(xi)^2;
    e = [e abs(lambda - mu)];   
    f = A*xi/norm(A*xi);
    x = [x f];
end

mu
plot(linspace(0,10, 10), e);

