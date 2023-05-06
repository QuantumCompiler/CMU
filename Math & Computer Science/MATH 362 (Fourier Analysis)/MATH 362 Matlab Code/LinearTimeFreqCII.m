function fcnplot = fcnplot(a,b,n)

%This program computes Fourier expansion of order n,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';
t2 = [t;1+t];


%Enter the formulas for the function.

f = a*t + b;

%Compute the Fourier coefficients and expansion of f.

cf = 1/N*fft(f);
af = 2*real(cf(2:M));
bf = -2*imag(cf(2:M));
af0 = real(cf(1));
hf = af0;
for m = 1:n
    hf = hf + af(m)*cos(2*pi*m.*t)+ bf(m)*sin(2*pi*m.*t);
end

cmagf = abs(cf(1:n+1));

%Report the coefficient vectors.

Coeff_af0_for_f = af0
Coeffs_ak_bk_for_f = [af(1:n),bf(1:n)]

%The formula for g will consist of f 
%followed by f in reverse order. 

g = [f;f(N:-1:1)];

%Compute the Fourier coefficients and expansion of g.

K = 2*N;
cg = 1/K*fft(g);
ag = 2*real(cg(2:N));
bg = -2*imag(cg(2:N));
ag0 = real(cg(1));
hg = ag0;
for m = 1:n
    hg = hg + ag(m)*cos(2*pi*m.*t2/2)+ bg(m)*sin(2*pi*m.*t2/2);
end

cmagg = abs(cg(1:n+1));

%Report the coefficient vectors.

Coeff_a0_for_g = ag0
Coeffs_ak_bk_for_g = [ag(1:n),bg(1:n)]

%Plot the time and frequency domain graphs together. 

z = zeros(N,1);
z2 = zeros(K,1);
top = max(0,1.2*max(g));
bottom = min(-0.2,min(g)-0.2);
heightf = 1.2*max(cmagf);
heightg = 1.2*max(cmagg);
right = n+1;

figure
subplot(2,2,1), plot(t,hf,'r',t,f,'b',t,z,'k')
title('Plot of f(t) with Fourier expansion')
axis([0 1 bottom top])

subplot(2,2,2), plot(t2,hg,'r',t2,g,'b',t2,z2,'k')
title('Plot of g(t) with Fourier expansion')
axis([0 2 bottom top])

subplot(2,2,3), stem(cmagf)
title('Fourier Coeff Magnitudes for f(t)')
axis([-0.5 right 0 heightf])

subplot(2,2,4),  stem(cmagg)
title('Fourier Coeff Magnitudes for g(t)')
axis([-0.5 right 0 heightg])

%figure
%plot(t2,g,'r',t2,z2,'k')
%title('Symmetric Extension g(t)')
%axis([0 2 bottom top])

%Plot the time and frequency domain graphs separately. 

%figure
%plot(t,f,'b',t,z,'k')
%title('Original Function f(t)')
%axis([0 1 bottom top])

%figure
%plot(t2,g,'r',t2,z2,'k')
%title('Symmetric Extension g(t)')
%axis([0 2 bottom top])

%figure
%plot(t2,h,'r',t2,g,'b',t2,z2,'k')
%title('Plot of g(t) with Fourier expansion')
%axis([0 2 bottom top])

%figure
%stem(cmag)
%title('Fourier Coefficient Magnitudes')
%axis([-0.5 right 0 heightg])


