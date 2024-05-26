function sortn = sortn(x)
 
%global y z k
N = length(x);
[y,k] = sort(x);

for n = 1:N
z(k(n)) = y(n);
end

x = x
y = y
z = z'

