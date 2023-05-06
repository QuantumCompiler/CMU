function fcnplot = fcnplot(m,N)
    
M = 100;

%m is the larger frequency index.
%M is the larger number of nodes.
%N is the smaller number of nodes. 

%Determine sample node vectors. 

t = [0:1/M:(M-1)/M]';
tn = [0:1/N:(N-1)/N]';

%Use remainder r of m/N to determine j, 
%where j is the smaller frequency index.
%There is a plus or minus sign (pm) that
%is used depending on value of r. 

r = mod(m,N);

if r < N/2
    pm = 1;
    j = r;
end
if r == N/2
    pm = 1;
    j = 0;
end
if r > N/2
    pm = -1;
    j = N - r;
end

%Enter the formulas for the sine functions. 

f = sin(2*pi*m.*t);
g = pm*sin(2*pi*j.*t);
f_N = sin(2*pi*m.*tn)
g_N = pm*sin(2*pi*j.*tn)

%Report the results and plot the functions:

Node_Info = ...
sprintf('Number of nodes: N = %d; Nyquist Freq Index: N/2 = %d.',N,N/2)

Frequency_Info = ...
sprintf('large freq = %d; remainder = %d; small freq = %d.',m,r,j)

if m == j 
    Aliasing_Conclusion = sprintf('There is no aliasing.')
else
    Aliasing_Conclusion = sprintf('There is aliasing.') 
end

subplot(1,2,1), plot(t,f,'b',t,g,'r--',tn,f_N,'ro')
title('Plot of f(t) with sampled f(t)')
axis tight

subplot(1,2,2), plot(t,g,'r',tn,g_N,'ro')
title('Plot of g(t) with sampled g(t)')
axis tight


