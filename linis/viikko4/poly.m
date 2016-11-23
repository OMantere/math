x = linspace(0,1,100);
[Q, R] = gsmith(eye(4));
figure
for i = 1:4;
    hold on;
    f = x.^3*Q(4, i)+x.^2*Q(3, i)+x.^1*Q(2, i)+Q(1, i);
    plot(x,f);
end
