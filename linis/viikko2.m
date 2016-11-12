figure

% Kaytetaan N 1-20
M = 20;

x = linspace(0, 1, 100);


% Piirretaan polynomi eri arvoilla

virhe = [];

for N=1:M;
  n = 1:N;

  H = hilb(N + 1);
  H1 = invhilb(N + 1);

  f = sin(2*pi.*x);

  b = [sum(f)];
  for i = n
      b = [b sum(f.*x.^i)];
  end

  a = H1*b';
  p = a(1);
  for i = n;
    p = p + a(i+1)*x.^i;
  end

  subplot(5, 1, 1);
  hold on;
  plot(x, p);
  title('Polynomit eri N arvoilla');
  axis([0 1 -100 100]);


  % Lasketaan virhe
  X = inv(H)*b';
  Xref = H1*b';
  virhe = [virhe norm(X-Xref)/norm(Xref)];
end


% Piiretään virhe
subplot(5, 1, 5);
hold on;
plot(n, virhe)
title('Suhteellinen virhe X - Xref');

  

% Piirretaan K2

n = 1:M;
nor = @(m) norm(hilb(m))*norm(invhilb(m));

K2 = [];
for i=n;
  K2 = [K2 nor(i)];
end

subplot(5, 1, 2);
plot(n, K2);
title('K2 eri N arvoilla - lineaarinen asteikko');
subplot(5, 1, 3);
loglog(n, K2);
title('K2 eri N arvoilla - logaritminen');
subplot(5, 1, 4);
semilogy(n, K2);
title('K2 eri N arvoilla - semilogaritminen');



