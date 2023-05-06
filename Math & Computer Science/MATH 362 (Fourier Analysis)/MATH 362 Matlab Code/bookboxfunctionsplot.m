%This script plots the box functions for N = 4.
%global M W

%Determine sample nodes. 

M = 400;
t = [0:1/M:(M-1)/M]';

%The following m-file computes the box functions,
%which are stored in the columns of the M x 4 matrix W.
%W is intialized to be the zero matrix. 

W = zeros(M,4);
boxfunctions(M);
W = W;

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

