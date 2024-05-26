"""
This program solves a second order differential equation numerically.
With the use of the Runge-Kutta method, any Second order differential equation
in the form where y'' is on one side of the equation can be solved.
"""

"""
User input:
    x0 = initial x value
    y0 = initial y value
    h = step size
    N = number of iterations
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy import special      #Airy functions are special functions 
    
def frk213(x,y):         #frk213 is the formula for diify q being solved'
    return x*y

def RK213(h,N):      #Runge-Kutta Method
    x0 = 0.0
    y0 = 0.35502805
    yp0 = -0.25881940
    xn = np.zeros(N+1)          
    y1n = np.zeros(N+1)
    y2n = np.zeros(N+1)          
    xn[0] = x0
    y1n[0] = y0
    y2n[0] = yp0
    for k in range(1,N+1):
        xn[k] = xn[k-1] + h             #Generate x nodes
        a1 = h*y2n[k-1]                 #Generate correct value
        a2 = h*frk213(xn[k-1],y1n[k-1]) #Generate new predictor value
        b1 = h*(y2n[k-1]+0.5*a2)        #Generate corrected value
        b2 = h*frk213(xn[k-1]+0.5*h,y1n[k-1]+0.5*a1)    #Generate predictor...
        c1 = h*(y2n[k-1]+0.5*b2)                        #This process repeats through d
        c2 = h*frk213(xn[k-1]+0.5*h,y1n[k-1]+0.5*b1)
        d1 = h*(y2n[k-1]+c2)
        d2 = h*frk213(xn[k-1]+h,y1n[k-1]+c1)
        y1n[k] = y1n[k-1]+(1.0/6.0)*(a1+2.0*b1+2.0*c1+d1)   #Numerical solution for y1
        y2n[k] = y2n[k-1]+(1.0/6.0)*(a2+2.0*b2+2.0*c2+d2)   #Numerical solution for y2
    
    ai, aip, bi, bip = special.airy(xn)     #Sample Airy Functions on xn
    print('Runge-Kutta y1 =', y1n)
    print('Exact y1 =', ai)
    print('Runge-Kutta y2 =', y2n)
    print('Exact y2 =', aip)
                   
    #Next, we sample y on n=100 x values and plot
    n = 100                              
    xvalues = np.linspace(0,1,n)    #Initialize x vector to be zeros
    ai, aip, bi, bip = special.airy(xvalues)    #Sample airy functions on X-Value
    
    #Plots and such
    plt.figure()
    plt.subplot(2,1,1)
    plt.plot(xvalues,ai,'-b',xn,y1n,'o--k')
    plt.xlabel('x')
    plt.legend(('Exact y1','Runge-Kutta'),loc=0)
    
    plt.subplot(2,1,2)
    plt.plot(xvalues,aip,'-b',xn,y2n,'o--k')
    plt.xlabel('x')
    plt.legend(('Exact y2','Runge-Kutta'),loc=0)
    
    plt.show()