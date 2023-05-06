function fcnplot = fcnplot(ymin,ymax,n)

%This programs computes the Legendre transform of order n + 1 for f 
%and graphs g_n and f. The value of n can be at most 8 here. 
%The viewing window for graph is [-1,1]x[ymin,ymax].
 
%Determine sample nodes. 

M = 800;
t = [-1:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = 12*t.^2 - 12;

%Enter formulas for the Legendre polynomials,
%and store them as columns in the matrix W. 

W(1:2*M,1) = 1;
W(1:2*M,2) = t;
W(1:2*M,3) = 0.5*(3*t.^2 - 1);
W(1:2*M,4) = 0.5*(5*t.^3 - 3*t);
W(1:2*M,5) = (1/8)*(35*t.^4 - 30*t.^2 + 3);
W(1:2*M,6) = (1/8)*(63*t.^5 - 70*t.^3 + 15*t);
W(1:2*M,7) = (1/16)*(231*t.^6 - 315*t.^4 + 105*t.^2 - 5);
W(1:2*M,8) = (1/16)*(429*t.^7 - 693*t.^5 + 315*t.^3 - 35*t);
W(1:2*M,9) = (1/128)*(6435*t.^8 - 12012*t.^6 + 6930*t.^4 - 1260*t.^2+35);

%Compute the coefficients and expansion.
clear g c
g(1:2*M) = zeros(2*M,1);
g = g';
for k = 1:n+1
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
    G(:,k)= g;
end

%Report the results and plot the functions. 

c = c'

z = 0*t;

figure
plot(t,z,'k',t,f,'b',t,g,'r')
title('Plot of f and g')
axis([-1 1 ymin ymax])
