function DFTvectors = DFTvectors(N)

%Determine sample nodes. 
    
t = [0:1/N:(N-1)/N]';

%Enter the formula for the function.
%This function will already be in vertical format.

f = 2*t - 1;

%Compute the Fourier expansion vectors g_n.
%We construct g_n as columns of N x N matrix. 

g = zeros(N,N);

for n = 1:N
    g(:,n) = exp(2*pi*i*(n-1)*t);
end

%Report the coefficient vectors as columns 
%of the inverse DFT matrix G.
%The matrix entries are rounded to clean up the display. 

G = round(g)




