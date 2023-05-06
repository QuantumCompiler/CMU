function fcnplot = fcnplot(N)
    
M = 100;

%N is the smaller number of nodes. 

%Determine sample node vectors. 

t = [0:1/M:(M-1)/M]';
tn = [0:1/N:(N-1)/N]';

%Enter the formulas for the sine functions. 

m = 1;
f = sin(2*pi*m.*t);
f_hat = sin(2*pi*m.*tn);

%Report the results and plot the functions:

subplot(1,2,1), plot(t,f,'b',tn,f_hat,'ro')
title('Plot of f with fn')
axis([0 1 -1 1])

subplot(1,2,2), plot(tn,f_hat,'r:o')
title('Plot of fn')
axis([0 1 -1 1])


