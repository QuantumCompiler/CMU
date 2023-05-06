function DCTII = DCTII(x) 

%This program starts with a given vector x and computes 
%the DCT II vector c2, using the definition of the DCT II.   

%Begin by ensuring that x is in vertical format. 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end  

%The next two commands sets up an index vector n
%to help simplify the application of the DCT II. 

N = length(x); 
n = [1:1:N]';

%The following loop implements DCT II using the definition
%of the DCT II (as opposed to using DCT II matrix)

for k = 1:N 
    c(k)=sqrt(2/N)*sum(x(n).*cos(pi./N*(n-1/2)*(k-1)))';
end

%The next two commands print the vector c2 to the screen. 

c(1) = c(1)/sqrt(2);
c2 = c'

%Now plot the vector c2. 

right = N+1;
height = 1.2*max(abs(c2));

figure 
stem(abs(c2)), title('DCT II Magnitudes')
axis([0 right 0 height])

