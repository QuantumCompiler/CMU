function MDCTwindow = MDCTwindow(N) 

m = 2*N;
L = 2*m;
k = [0:1:m-1]';
w = sqrt(2)*sin(pi./m*(k+0.5));

%Compute and plot the MDCT window blocks.

nb = (L/N) - 1;
WB = zeros(L,nb);
r = 1;

for B = 0:N:L-m;
   WB(B+1:B+m,r) = w(1:m);
   r = r + 1;
end


t = [1:1:L];

figure
plot(t,WB(:,1),'b',t,WB(:,2),'r',t,WB(:,3),'k')
title('Overlapping MDCT Windows')
axis ([0 L 0 1.5])



