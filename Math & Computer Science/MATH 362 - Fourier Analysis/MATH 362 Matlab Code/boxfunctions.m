function [W] =boxfunctions(M)
global W
    
%Determine sample nodes. 

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

%figure

%plot(t,W(:,1),'b')
%title('Plot of B1')
%axis([0 1 -0.2 1.2])

%figure

%plot(t,W(:,2),'b')
%title('Plot of B2')
%axis([0 1 -0.2 1.2])

%figure

%plot(t,W(:,3),'b')
%title('Plot of B3')
%axis([0 1 -0.2 1.2])

%figure
%plot(t,W(:,4),'b')
%title('Plot of B4')
%axis([0 1 -0.2 1.2])

