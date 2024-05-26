%This script plots the box functions for N = 4.

%Determine sample nodes. 

M = 400;
t = [0:1/M:(M-1)/M]';

%Enter formulas for the box functions,
%and store them as columns in a matrix W. 

W(1:M/4,1) = 1;
W(M/4+1:M,1) = 0;

W(1:M/4,2) = 0;
W(M/4+1:2*M/4,2) = 1;
W(2*M/4+1:M,2) = 0;

W(1:2*M/4,3) = 0;
W(2*M/4+1:3*M/4,3) = 1;
W(3*M/4+1:M,3) = 0;

W(1:3*M/4,4) = 0;
W(3*M/4+1:M,4) = 1;

%Plot the functions. 

figure

subplot(2,2,1), plot(t,W(:,1),'b')
title('Plot of B1')
axis([0 1 -0.2 1.2])

subplot(2,2,2), plot(t,W(:,2),'b')
title('Plot of B2')
axis([0 1 -0.2 1.2])

subplot(2,2,3), plot(t,W(:,3),'b')
title('Plot of B3')
axis([0 1 -0.2 1.2])

subplot(2,2,4), plot(t,W(:,4),'b')
title('Plot of B4')
axis([0 1 -0.2 1.2])

