function DCTIV = DCTIV(x) 

%This program starts with a given vector x and computes 
%the DCT IV vector c4, using the definition of the DCT IV.   

%Begin by ensuring that x is in vertical format. 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end  

%The next two commands sets up an index vector n
%to help simplify the application of the DCT IV. 

N = length(x); 
n = [1:1:N]';

%The following loop implements DCT IV using the definition
%of the DCTIV (as opposed to using DCT IV matrix)

for k = 1:N 
    c(k)=sqrt(2/N)*sum(x(n).*cos(pi./N*(n-1/2)*(k-1/2)))';
end

c4 = c'

%Now plot the vector c4. 

right = N+1;
height = 1.2*max(abs(c4));

figure 
stem(abs(c4)), title('DCT IV Magnitudes')
axis([0 right 0 height])

