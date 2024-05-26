function fcnplot = fcnplot(N,m)
    
%N is the smaller number of nodes. 
%m is the larger frequency index.

%M is a large number of nodes, used
%to graph $f$ and $g$.

M = 1000;

%Determine sample node vectors. 

tM = [0:1/M:(M-1)/M]';
tN = [0:1/N:(N-1)/N]';

%Use remainder r of m/N to determine j, 
%where j is the smaller frequency index.

r = mod(m,N);

if r < N/2
    pm = 1;
    j = r;
end
if r == N/2
    j = 0;
end
if r > N/2
    j = N - r;
end

%Enter the formulas for the cosine functions. 

f = cos(2*pi*m.*tM);
g = cos(2*pi*r.*tM);
fN = cos(2*pi*m.*tN)
gN = cos(2*pi*r.*tN)

%Report the results and plot the functions:

Node_Info = ...
sprintf('Number of nodes: N = %d; Nyquist Freq Index: N/2 = %d.',N,N/2)

Frequency_Info = ...
sprintf('large freq = %d; remainder = %d; small freq = %d.',m,r,r)

if m == j 
    Aliasing_Conclusion = sprintf('There is no aliasing.')
else
    Aliasing_Conclusion = sprintf('There is aliasing.') 
end

figure
plot(tN,fN,'rs',tM,f,'r',tN,gN,'b*',tM,g,'b')
title('Plot of f, g, f_N and g_N')
axis([0 1 -1.1 1.1])

%figure
%subplot(1,2,1), plot(tM,f,'r',tM,g,'b--',tN,fN,'bo')
%title('Plot of f, g and f_N')
%axis tight

%subplot(1,2,2), plot(tM,g,'b--',tN,gN,'bo')
%title('Plot of g and g_N')
%axis tight


