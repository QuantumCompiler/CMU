function threshold = threshhold(x,r)

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   

N = length(x);

%Note that we want to threshold R percent of the nonzero values.
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
%the nonzero entries in z and resets their values to 1.  
%The new z is then multiplied pointwise with x.
%Thus z will now be the R% thresholded x.

for k = 1:N
    if z(k) ~= 0
        z(k) = 1;
    end
end

%Report the results and output:
Thresholded_x = z.*x
Percent_Reduction = R/M*100
Compression_Ratio = [M;M-R]

%Now graph the original and compressed vectors side-by-side for comparison.

tN = [1:N];
a = min(min(x),min(z));
b = max(max(x),max(z));

figure

subplot(1,2,1), plot(tN,x,'bo',tN,x,'r'), axis([0 N+1 a-1 b+1])
title('Original Vector')

subplot(1,2,2), plot(tN,z,'bo',tN,z,'r'), axis([0 N+1 a-1 b+1])  
title('Thresholded Vector')



