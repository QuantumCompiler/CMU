function threshrmagcomplex = threshrmagcomplex(x,r)
 
global z PR CR

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   

N = length(x);

%We set to zero all elements of x that are negligable. 
tol = 10^(-14);
for i = 1:N
    if abs(x(i)) < tol
        x(i)=0;
    end
end

%Note that we want to threshold R% of the nonzero values.
xnz = [nonzeros(x)];
M = length(xnz);
R = round(r/100*M);
P = N-M+R+1;

%The next command sorts the vector abs(x) in ascending order.
%The vector y represents the sorted abs(x) vector.
%The vector k stores the original indices of the entries in abs(x). 
[y,k] = sort(abs(x));

%These commands create an R% thresholded sorted abs(x). 
zx = zeros(N-M,1);
zr = zeros(R,1);
yp = y(P:N);
ty = [zx;zr;yp];

%This loop reverses the sort. 
%The resulting vector z is the R% thresholded abs(x).
%Initialize z to be the zero vector of appropriate length. 
z = zeros(N,1);
for n = 1:N
z(k(n)) = ty(n);
end

%We next need to convert the thresholded z = abs(x) to
%the thresholded x.  The following loop determines
%the locations of the nonzero entries in z. 

for k = 1:N
    if z(k) ~= 0
        z(k) = 1;
    end
end

z = z.*x;

%Thus z will now be the R% thresholded x.

%Report the results and output:
PR = R/M*100;
CR = [M;M-R];

x = x
z = z
PR = PR
CR = CR

