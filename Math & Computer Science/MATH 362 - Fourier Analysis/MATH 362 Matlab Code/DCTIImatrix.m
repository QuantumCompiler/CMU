function DCTIImatrix = DCTIImatrix(x) 

%This program starts with a given vector x and computes 
%the corresponding DCTII vector c2, using the DCTII matrix. 

%Begin by ensuring that x is in vertical format. 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end  

%Compute the DCTII and inverse DCTII matrices. 

N = length(x); 

for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1));
    end
end
   
C(1,:) = sqrt(1/2)*C(1,:);
C = sqrt(2/N)*C;
CInv = inv(C);

%The next two commands computes the vectors c2 and x2, then
%prints them to the screen. The vector x2 should match x. 

c2 = C*x
x2 = CInv*c2

%Now plot the vector c2. 

right = N+1;
height = 1.2*max(abs(c2));

figure 
stem(abs(c2)), title('DCTII Magnitudes')
axis([-0.5 right 0 height])
