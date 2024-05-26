function threshr = threshr(x,r)
 
%global y z k
N = length(x);
[y,k] = sort(x);
M = round(r/100*N)
zm = zeros(M,1);
ym = y(M+1:N);
ty = [zm;ym];

for n = 1:N
z(k(n)) = ty(n);
end

x = x
z = z'

