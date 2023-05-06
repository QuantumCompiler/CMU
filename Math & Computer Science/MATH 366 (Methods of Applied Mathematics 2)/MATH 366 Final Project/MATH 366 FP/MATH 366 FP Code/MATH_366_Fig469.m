%The following commands graph the analytical solution u(x,t) %for different time values.
%The analytical solution is u(x,t) = sin(pi*x)*exp(-pi^2*t).%The analytical solution is sampled on x = 20 spatial nodes. 
M = 20;
x = [0:1/M:1]';
f1 = sin(pi*x)*exp(-pi^2*0);
f2 = sin(pi*x)*exp(-pi^2*0.04);
f3 = sin(pi*x)*exp(-pi^2*0.08);
f4 = sin(pi*x)*exp(-pi^2*0.12);
f5 = sin(pi*x)*exp(-pi^2*0.16);
f6 = sin(pi*x)*exp(-pi^2*0.20);
%Plot analytical solution and numerical solution. 
plot(x,[f1,f2,f3,f4,f5,f6],'b')
title('Plot of Temperature for Different Time Steps') 
axis([0 1 0 1.1])