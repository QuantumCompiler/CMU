function MDCTmatrix = MDCTmatrix(x) 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end

M = length(x); 
N = M/2;

for i = 1:N
    for j = 1:M
        C(i,j) = cos(pi./N*(j-1/2+N/2)*(i-1/2));
    end
end

C = sqrt(1/N)*C
CI = C'
D = CI*C

cm = C*x
y = CI*cm
%stem(abs(cm))
