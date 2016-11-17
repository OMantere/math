% Palauttaa aproksimaation vektorille
%
% b_i = int_0^1 q_i(x) fun(x) dx. 
%
% aproksimaatio lasketaan trapetsisäännöllä.
%
% basis on funktio joka palauttaa käytössä olevan polynomikannan, 
% esimerkiksi basis = 'monomial_basis'
%
% fun on funktio, jota approksimoidaan. 
% esimerkiksi fun = @(x)( sin(2*pi*x) ).
% 
% n on polynomikanna aste
%
% N = trapetsisäännnn parametri. 

function b = compute_b(basis,fun,n,N)

% Jaa v�li N intervalliin
x = linspace(0,1,N+1);
h = 1/N;

% laske polynomin arvo 
P = feval(basis,x,n);

% laske funktion arvo
fval = fun(x)';

% Trapetsisääntö
fval(2:(end-1)) = 2*fval(2:(end-1));
b = P*fval(:)*h/2;






