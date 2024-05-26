%This script plots the Haar wavelet functions for N = 4.

%Determine sample nodes. 

M = 200;
t = [0:1/M:(M-1)/M]';

%Enter formulas for the functions. 

b(1:M) = 1;

w(1:M/2) = 1;
w(M/2+1:M) = -1;

wd10(1:M/4) = 1;
wd10(M/4+1:M/2) = -1;
wd10(M/2+1:M) = 0;

wd11(1:M/2) = 0;
wd11(M/2+1:3*M/4) = 1;
wd11(3*M/4+1:M) = -1;

%Plot the functions. 

subplot(2,2,1), plot(t,b,'b')
title('Plot of B')
axis([0 1 -1.2 1.2])

subplot(2,2,2), plot(t,w,'b')
title('Plot of W')
axis([0 1 -1.2 1.2])

subplot(2,2,3), plot(t,wd10,'b')
title('Plot of W(1,0)')
axis([0 1 -1.2 1.2])

subplot(2,2,4), plot(t,wd11,'b')
title('Plot of W(1,1)')
axis([0 1 -1.2 1.2])

figure
plot(t,b,'b')
title('Plot of B')
axis([0 1 -1.2 1.2])

figure
plot(t,w,'b')
title('Plot of W')
axis([0 1 -1.2 1.2])

figure
plot(t,wd10,'b')
title('Plot of W(1,0)')
axis([0 1 -1.2 1.2])

figure
plot(t,wd11,'b')
title('Plot of W(1,1)')
axis([0 1 -1.2 1.2])

