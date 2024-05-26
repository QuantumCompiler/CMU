function window = window(a,b,N) 

%This program computes the DCT IV values of the 
%windowed function f of length N, and the plots 
%the magnitudes of these values.  

%Determine sample nodes. 

t = [0:1/N:(N-1)/N]';

%Enter the formula for the function.
 
f = a*t + b;

%The first command sets up an index vector n
%to help simplify the computation of w.

n=[0:1:N-1]';

%The next command generates the window vector w 
%and the windowed function fw. 

w = sin(pi./N*(n+0.5));
fw = f.*w;

%Compute the DCT IV matrix. 

for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1/2));
    end
end
   
C = sqrt(2/N)*C;
c4 = C*f;
c4w = C*fw;

%Now generates some plots. 
 
right = N+1;
height1 = min([0,0.8*min(f),1.2*min(f)]);
height2 = max([0,0.8*max(f),1.2*max(f)]);
height3 = 1.2*max(max(abs(c4)),max(abs(c4w)));

figure 

subplot(2,2,1), stem(f), title('Plot of f')
axis([0 right height1 height2])

subplot(2,2,2), stem(fw), title('Plot of Windowed f')
axis([0 right height1 height2])

subplot(2,2,3), stem(abs(c4)), title('DCT IV Magnitudes for f')
axis([0 right 0 height3])

subplot(2,2,4), stem(abs(c4w)), title('DCT IV Magnitudes for Windowed f')
axis([0 right 0 height3])

