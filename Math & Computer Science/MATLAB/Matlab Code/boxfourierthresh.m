function fcnplot = fcnplot(n,r) 
global z PR CR 

N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f(1:M) = 1;
f(M+1:N) = 0;
f = f';

%Compute the Fourier coefficients and expansion.

c = 1/N*fft(f);
a = 2*real(c(2:M));
b = -2*imag(c(2:M));
a0 = real(c(1));
g = a0;
for m = 1:n
    g = g + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

%Call the thresholding program for the coefficients.

c_original = c(1:n+1);
c = c(1:n+1);
threshold(c,r)
c = z;

%Compute the thresholded Fourier expansion.
a = 2*real(c(2:n+1));
b = -2*imag(c(2:n+1));
a0 = real(c(1));
gt = a0;
for m = 1:n
    gt = gt + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

%Report the results and output from threshold program:

c_original = c_original
c_thresholded = c

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Now graph the original and compressed
%files side-by-side for comparison.

subplot(2,2,1), plot(t,g,'r',t,f,'b')
title('Plot of f(t) with Fourier expansion')
axis tight

subplot(2,2,2), plot(t,gt,'r',t,f,'b')
title('Plot of f(t) with thresholded Fourier expansion')
axis tight

subplot(2,2,3), stem(abs(c_original(1:n+1))),
title('Original Fourier Coefficient Magnitudes')

subplot(2,2,4), stem(abs(c(1:n+1))),
title('Thresholded Fourier Coefficient Magnitudes')
