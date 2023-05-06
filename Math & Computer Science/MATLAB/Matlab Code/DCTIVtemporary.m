function window = window(x) 

%This program computes the DCT IV window vector w of length N
%and also the windowed vector xm, and then plots xw.  

N = length(x); 

%The first command sets up an index vector n
%to help simplify the computation of w.

n=[0:1:N-1]';

%The next command generates w and xw. 

w = sin(pi./N*(n+0.5));
xw = x.*w;

%Now plot the vector w. 
  
right = N+1;
height1 = min([0,0.8*min(xw),1.2*min(xw)]);
height2 = max([0,0.8*max(xw),1.2*max(xw)]);


figure 
stem(xw), title('Plot of the DCT IV Windowed Vector')
axis([0 right height1 height2])


