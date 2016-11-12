function out = F(x, b, n)
out = 0
for i=0:n
  out += b(i)*x^i;
end
end
