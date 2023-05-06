function zeropad8 = zeropad8(A)


%Zero pad the matrix A if necessary.

[M,N] = size(A);
A = double(A);

if mod(M,8) == 0
   rm = 0;
else 
   rm = 8 - mod(M,8);
end
if mod(N,8) == 0
   rn = 0;
else 
   rn = 8 - mod(N,8);
end
Z1 = zeros(M,rn); 
Z2 = zeros(rm,N+rn);
A = [A,Z1;Z2]
