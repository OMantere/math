figure
N = 15;
K2 = [];

for n=1:N;
  % Interpoloitava funktio
  fun = @(x)(sin(2*pi*x));

  % Laske vektori b
  b = compute_b('legendre_basis',fun,n, 100000);

  A = zeros(n+1, n+1); 
  for i=1:n+1;
    for j=1:n+1;
      if i == j
        A(i, j) = 1/(2*i-1);
      else
        A(i, j) = 0;
      end
    end
  end

  % K2 arvot
  K2 = [K2 cond(A, 2)];

  % Ratkaise tehtävä

  cof = inv(A)*b;

  % piirrä ratkaisu. 
  t = linspace(0,1,100);
  P = legendre_basis(t,n);

  val = P'*cof;
  subplot(4, 1, 1);
  plot(t,val,'r--');
  hold on;
  plot(t,fun(t));
end


subplot(4, 1, 2);
plot(1:N, K2);
title('K2 eri N arvoilla - lineaarinen asteikko');
subplot(4, 1, 3);
loglog(1:N, K2);
title('K2 eri N arvoilla - logaritminen');
subplot(4, 1, 4);
semilogy(1:N, K2);
title('K2 eri N arvoilla - semilogaritminen');
