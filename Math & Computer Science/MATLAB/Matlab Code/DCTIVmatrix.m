function DCTIVmatrix = DCTIVmatrix(x) 

%This program starts with a given vector x and computes 
%the corresponding DCT IV vector c4, using the DCT IV matrix. 

%Begin by ensuring that x is in vertical format. 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end  

%Compute the DCT IV and inverse DCT IV matrices. 

N = length(x); 

for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1/2));
    end
end
   
C = sqrt(2/N)*C;
CInv = C;

%The next two commands computes the vectors c4 and x2, then
%prints them to the screen. The vector x2 should match x. 

c4 = C*x
x2 = CInv*c4

%Now plot the vector c4. 

right = N+1;
height = 1.2*max(abs(c4));

figure 
stem(abs(c4)), title('DCT IV Magnitudes')
axis([0 right 0 height])
