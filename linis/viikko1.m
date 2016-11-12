% 
% Cover all directions
%

N = 1000;  

t = linspace(0,2*pi,N);

x = cos(t);
y = sin(t);

figure;

% muokkaa silmukkaa siten, että tehtävänannon p:t tulevat käytyä lävitse.
a = [1,2];
for p=a;
%p = 20;

for i=1:N
   
    rho = 1/(abs(x(i))^p+abs(y(i))^p) % Täytä tähän oikea kerroin, jotta vektorin pituus p-normissa olisi 1.
    
    xplot(i) = rho*x(i);
    yplot(i) = rho*y(i);
    
end


hold on;
plot(xplot,yplot);

end

for i=1:N
   
    rho = 1/max(abs(x(i)), abs(y(i))); % Täytä tähän oikea kerroin, jotta vektorin pituus p-normissa olisi 1.
        
    xplot(i) = rho*x(i);
    yplot(i) = rho*y(i);
    
end


hold on;
axis([-1.5, 1.5, -1.5, 1.5])
plot(xplot,yplot);

% inf normia ei voi lisätä silmukassa - lisää se tässä manuaalisesti. 