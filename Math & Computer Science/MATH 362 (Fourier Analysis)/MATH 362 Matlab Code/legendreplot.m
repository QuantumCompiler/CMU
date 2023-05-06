%This script plots the Legendre polynomials for n = 0,1,2,3. 

%Determine sample nodes. 

M = 200;
t = [-1:1/M:(M-1)/M]';

%Enter formulas for the Legendre polynomials,
%and store them as columns in a 2M x 8 matrix W. 

W(1:2*M,1) = 1;
W(1:2*M,2) = t;
W(1:2*M,3) = 0.5*(3*t.^2 - 1);
W(1:2*M,4) = 0.5*(5*t.^3 - 3*t);
W(1:2*M,5) = (1/8)*(35*t.^4 - 30*t.^2 + 3);
W(1:2*M,6) = (1/8)*(63*t.^5 - 70*t.^3 + 15*t);
W(1:2*M,7) = (1/16)*(231*t.^6 - 315*t.^4 + 105*t.^2 - 5);
W(1:2*M,8) = (1/16)*(429*t.^7 - 693*t.^5 + 315*t.^3 - 35*t);


%Plot the functions. 

plot(t,W(1:2*M,1),'-b',t,W(1:2*M,2),':k',t,W(1:2*M,3),'-r',t,W(1:2*M,4),'--b')
title('Plot of P0, P1, P2, P3')
axis([-1,1,-1.2,1.2])

%figure
%plot(t,W(:,1),'b')
%title('Plot of P0')
%axis([0 1 -1.2 1.2])

%figure
%plot(t,W(:,2),'b')
%title('Plot of P1')
%axis([0 1 -1.2 1.2])

%figure
%plot(t,W(:,3),'b')
%title('Plot of P2')
%axis([0 1 -1.2 1.2])

%figure
%plot(t,W(:,4),'b')
%title('Plot of P3')
%axis([0 1 -1.2 1.2])


