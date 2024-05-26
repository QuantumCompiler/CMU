function timefreqplot = timefreqplot(a0,a,b,ymin,ymax)

%For a function f defined on [0,1], this program 
%plots the time and frequency domain graphs of f. 

%The inputs are a0, the coefficient vectors a and b,
%and the ymin and ymax values for the plot window. 

%Initialize T value

T = 1;

%Determine sample nodes on [0,1]. 

N = 100;
t = [0:1/N:(N-1)/N]';

%Generate formula for f by adding in terms. 

f = a0;
for k = 1:8
    f = f + a(k)*cos(2*pi*k.*t)+ b(k)*sin(2*pi*k.*t);
end

%Generate the values of coefficient magnitudes. 

c0 = a0;
for k = 1:8
    c(k) = 0.5*sqrt(a(k)^2 + b(k)^2);
end

%Construct vector ck of coefficient magnitudes. 

c = [c0,c(1:8)];

%Plot the time and frequency domain graphs.

figure
subplot(1,2,1), plot(t,f,'b')
title('Time Domain Plot of f(t)')
axis([0 1 ymin ymax])

subplot(1,2,2),stemfft(c,T),
title('Frequency Domain Plot of f(t)')

figure
plot(t,f,'b')
title('Time Domain Plot of f(t)')
axis([0 1 ymin ymax])

figure
stemfft(c,T),
title('Frequency Domain Plot of f(t)')

