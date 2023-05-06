function DCTIVmatrix = DCTIVmatrix(x) 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end

N = length(x); 

for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1/2));
    end
end
   
C = sqrt(2/N)*C
CInv = inv(C)

c4 = C*x
stem(abs(c4))
