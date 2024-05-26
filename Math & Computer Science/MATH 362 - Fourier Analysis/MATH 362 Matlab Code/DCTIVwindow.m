function windowplot = windowplot(N) 

%This program computes the DCT IV window vector w of length N
%and then plots the graph of w.  

%The first command sets up an index vector n
%to help simplify the computation of w.

n=[0:1:N-1]';

%The next command generates w. 

w = sin(pi./N*(n+0.5));

%Now plot the vector w. 
  
right = N+1;
height = 1.2*max(abs(w));

figure 
stem(w), title('Plot of the DCT IV Window')
axis([0 right 0 height])

