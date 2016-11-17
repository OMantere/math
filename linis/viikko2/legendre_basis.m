%
% Antti Hannukainen / Tapiola / 31.10.2016
%
% Palauttaa legendren polynomikanna
% arvot annetuissa pisteissä
%
% x = 1xN vektori evaluaatio pisteitä
% n = kannan aste.

% P = (n+1)XN matriisi, jossa
%     P(k,:) = on q_k :n arvo pisteissä x.
%

function P = legendre_basis(x,n)


x = 2*x-1;

P = zeros(n, length(x) );

if(n >= 0)
    P(1,:) = ones(1,length(x));
end

if(n >= 1)
    P(2,:) = x;
end

for i=2:(n)
    P(i+1,:) = ((2*i-1)/i)*x.*P(i,:) - ((i-1)/i)*P(i-1,:);
end


