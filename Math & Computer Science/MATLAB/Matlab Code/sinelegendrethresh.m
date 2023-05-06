function legendrethresh = legendrethresh(n,r)
global W z PR CR 

%This function thresholds the Legendre polynomial expansion,
%for n = 0,1,...,7, and for threshold value r%. 

%Determine sample nodes. 

M = 200;
t = [-1:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = sin(2*pi*t);

%The following m-file computes the Legendre polynomials,
%which are stored in the columns of the 2M x 8 matrix W.
%W is intialized to be the zero matrix. 

W = zeros(2*M,n);
legendrepolynomials(M)

%Next, compute the coefficients and Legendre polynomial expansion.

clear g
g(1:2*M) = zeros(2*M,1);
g = g';
for k = 1:n
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Call the thresholding program for the coefficients,
%and then construct the thresholded expansion. 

threshold(c,r)
c_T = z;

g_T(1:2*M) = zeros(2*M,1);
g_T = g_T';
for k = 1:n
    g_T = g_T + c_T(k)*W(:,k);
end

%Report the results and output from threshold program:

c_original = c'
c_thresholded = c_T

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Now graph the original and compressed
%files side-by-side for comparison.

subplot(2,2,1), plot(t,f,'b',t,g,'r')
title('Legendre Polynomial Expansion')

subplot(2,2,2), plot(t,f,'b',t,g_T,'r')
title('Thresholded Legendre Expansion')

subplot(2,2,3), stem(abs(c)),
title('Original Legendre Coefficient Magnitudes')

subplot(2,2,4), stem(abs(c_T)),
title('Thresholded Legendre Coefficient Magnitudes')