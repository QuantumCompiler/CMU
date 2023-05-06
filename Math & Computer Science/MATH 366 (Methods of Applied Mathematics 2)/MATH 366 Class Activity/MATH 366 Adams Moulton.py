# -*- coding: utf-8 -*-
"""
User input:
    x0 = initial x value
    y0 = initial y value
    h = step size
    N = number of iterations
"""

import numpy as np
import matplotlib.pyplot as plt

def yam(x):           
    return np.exp(x) - x - 1.0
    
def fam(x,y):     
    return y + x

def AdamsM(x0,y0,h,N):  
    xn = np.zeros(N+1)          
    yn = np.zeros(N+1)
    YN = np.zeros(N+1)
    FN = np.zeros(N+1)          
    xn[0] = x0
    yn[0] = y0
    for k in range(1,4):
        xn[k] = xn[k-1] + h             
        k1 = h*fam(xn[k-1],yn[k-1])       
        k2 = h*fam(xn[k-1]+0.5*h,yn[k-1]+0.5*k1)      
        k3 = h*fam(xn[k-1]+0.5*h,yn[k-1]+0.5*k2)
        k4 = h*fam(xn[k],yn[k-1]+k3)
        yn[k] = yn[k-1]+(1.0/6.0)*(k1+2.0*k2+2.0*k3+k4)   
        
    for k in range(4,N+1):
        xn[k] = xn[k-1] + h
        yn[k] = yn[k-1]+(1.0/6.0)*(k1+2.0*k2+2.0*k3+k4) 
        f1 = fam(xn[k-1],yn[k-1])
        f2 = fam(xn[k-2],yn[k-2])
        f3 = fam(xn[k-3],yn[k-3])
        f4 = fam(xn[k-4],yn[k-4])  
        YN[k] = yn[k-1] + (h/24.0)*(55.0*f1 - 59.0*f2 + 37.0*f3 - 9.0*f4)
        FN[k] = fam(xn[k],YN[k])
        yn[k] = yn[k-1] + (h/24.0)*(9.0*FN[k] + 19.0*f1 - 5.0*f2 + f3)
        
    
    print('Adams Moulton Method',yn)
                   
   
    n = 100                              
    xvalues = np.zeros(n+1)    
    yvalues = np.zeros(n+1)    
    
    step = (xn[N]-x0)/n      
    for k in range(0,n+1):
        xvalues[k] = x0 + k*step      
        yvalues[k] = yam(xvalues[k])    
               
    plt.plot(xvalues,yvalues,'b',xn,yn,'o--k')   
    plt.xlabel('x')
    plt.legend(('Exact','Adams Moulton'),loc = 0)
    plt.show()
    
         
        
    