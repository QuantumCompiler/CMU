function fcnplot = fcnplot(n)

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f = sin(2*pi*t).*cos(4*pi.*t);

%Plot the function.
figure
topline(1:N) = max(f)+0.2;
bottomline(1:N) = min(f)-0.2;
plot(t,topline,'k',t,bottomline,'k')
hold on
plot(t,f,'b')
hold off
title('Plot of f(t)')
axis tight
