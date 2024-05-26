function fcnplot = fcnplot(N) 

%Determine sample nodes. 

t = [0:1/N:(N-1)/N]';

%Enter the formula for the function.

f = exp(t) + 1;

%The formula for g will consist of f. 

g = [f;-f(N:-1:1);-f;f(N:-1:1)];

%Plot the original vector x and its even-odd extension y. 

right = 4*N+1;
height1 = min(0.8*min(g),1.2*min(g));
height2 = 1.2*max(g);

figure 
subplot(1,2,1),stem(f)
title('Plot of f')
axis([-0.5 right height1 height2])

subplot(1,2,2),stem(g)
title('Plot of g')
axis([-0.5 right height1 height2])
