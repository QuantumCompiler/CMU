function DFTvectors = DFTvectors(N)

%Determine sample nodes. 
    
t = [0:1/N:(N-1)/N]'

%Compute the Fourier expansion vectors g_n.
%We construct g_n as columns of N x N matrix. 

g = zeros(N,N);

for n = 1:N
    g(:,n) = exp(2*pi*i*(n-1)*t);
end

%Report the coefficient vectors as columns 
%of the inverse DFT matrix G.

G = g




