# -*- coding: utf-8 -*-
"""
This program implements the Euler Method for solving an ODE.
User input:
    x0 = initial x value
    y0 = initial y value
    h = step size
    N = number of iterations
"""

import numpy as np
import matplotlib.pyplot as plt

def ye(x):           #Exact solution to ODE
    return np.exp(x) - x - 1.0
    #return np.exp(-20.0*x) +1.0*x**2
 
def fe(x,y):         #This is the formula for y'
    return y + x
    #return -20.0*y + 20.0*x**2 + 2.0*x
    
def euler(x0,y0,h,N):           #Euler Method
    xn = np.zeros(N+1)          #Initialize x nodes
    yn = np.zeros(N+1)          #Initalize Euler yn values
    xn[0] = x0
    yn[0] = y0
    for k in range(1,N+1):
        xn[k] = xn[k-1] + h     #Generate x nodes
        yn[k] = yn[k-1] + h*fe(xn[k-1],yn[k-1])  #Euler yn values
                       
    print('Euler Solution=', yn)
    
    #Next, we sample y on n=100 x values and plot f & y
    n = 100                              
    xvalues = np.zeros(n+1)    #Initialize x vector to be zeros
    yvalues = np.zeros(n+1)    #Initialize y vector to be zeros
    
    step = (xn[N]-x0)/n  #Use this step to get xinterval = [x0,xn(N)]. 
    for k in range(0,n+1):
        xvalues[k] = x0 + k*step          #Generate vector of x values
        yvalues[k] = ye(xvalues[k])    #Generate vector of y(x) values
               
    plt.plot(xvalues,yvalues,'-b',xn,yn,'o--k')   
    plt.xlabel('x')
    plt.legend(('Exact','Euler'),loc = 0)
    plt.show()
    
         
        
    