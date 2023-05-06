function fcnplot = fcnplot(N)
    
M = 100;

%N is the smaller number of nodes. 

%Determine sample node vectors. 

t = [0:1/M:(M-1)/M]';
tn = [0:1/N:(N-1)/N]';

%Enter the formulas for the sine functions. 

f = exp(t) + 1;;
f_hat = exp(tn) + 1;;

%Report the results and plot the functions:

subplot(1,2,1), plot(t,f,'b',tn,f_hat,'ro')
title('Plot of f with fn')
axis tight

subplot(1,2,2), plot(tn,f_hat,'r:o')
title('Plot of fn')
axis tight


