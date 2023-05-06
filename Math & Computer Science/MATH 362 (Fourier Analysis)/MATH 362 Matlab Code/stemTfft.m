function stemTfft = stemTfft(x,T)
    
L = length(x);
freq = (1/T)*linspace(0,L-1,L);

%MATLAB:
stem(freq,x); 

%FreeMat (the following command needs work)
%stemfreemat(freq,x);
    
 
