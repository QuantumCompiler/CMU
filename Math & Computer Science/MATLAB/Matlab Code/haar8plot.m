%This script plots the Haar wavelet functions for N = 8. 
    
%Determine sample nodes. 

M = 400;
t = [0:1/M:(M-1)/M]';

%Enter formulas for the Haar wavelet functions,
%and store them as columns in a matrix W. 

clear W

W(1:M,1) = 1;

W(1:M/2,2) = 1;
W(M/2+1:M,2) = -1;

W(1:M/4,3) = 1;
W(M/4+1:M/2,3) = -1;
W(M/2+1:M,3) = 0;

W(1:M/2,4) = 0;
W(M/2+1:3*M/4,4) = 1;
W(3*M/4+1:M,4) = -1;

W(1:M/8,5) = 1;
W(M/8+1:2*M/8,5) = -1;
W(2*M/8+1:M,5) = 0;

W(1:2*M/8,6) = 0;
W(2*M/8+1:3*M/8,6) = 1;
W(3*M/8+1:4*M/8,6) = -1;
W(4*M/8+1:M,6) = 0;

W(1:4*M/8,7) = 0;
W(4*M/8+1:5*M/8,7) = 1;
W(5*M/8+1:6*M/8,7) = -1;
W(6*M/8+1:M,7) = 0;

W(1:6*M/8,8) = 0;
W(6*M/8+1:7*M/8,8) = 1;
W(7*M/8+1:M,8) = -1;

%Plot the functions. 

figure

subplot(2,2,1), plot(t,W(:,5),'b')
title('Plot of W(2,0)')
axis([0 1 -1.2 1.2])

subplot(2,2,2), plot(t,W(:,6),'b')
title('Plot of W(2,1)')
axis([0 1 -1.2 1.2])

subplot(2,2,3), plot(t,W(:,7),'b')
title('Plot of W(2,2)')
axis([0 1 -1.2 1.2])

subplot(2,2,4), plot(t,W(:,8),'b')
title('Plot of W(2,3)')
axis([0 1 -1.2 1.2])

%Plot the functions separately. 

%figure
%plot(t,W(:,5),'b')
%title('Plot of W(2,0)')
%axis([0 1 -1.2 1.2])

%figure
%plot(t,W(:,6),'b')
%title('Plot of W(2,1)')
%axis([0 1 -1.2 1.2])

%figure
%plot(t,W(:,7),'b')
%title('Plot of W(2,2)')
%axis([0 1 -1.2 1.2])

%figure
%plot(t,W(:,8),'b')
%title('Plot of W(2,3)')
%axis([0 1 -1.2 1.2])

