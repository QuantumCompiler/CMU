# -*- coding: utf-8 -*-
"""
This program uses the 3pt Qauss guadrature method (GQ3) to compute the value  
of the area of f(x) over [a,b] using 3 nodes. 
The GQ3 curve plot is generated using deg 2 Lagrange interpolating polynomial. 

#User input: a, b

@author: Phil
"""

import numpy as np
import matplotlib.pyplot as plt

def f(x):                                    #This is f(x)
    return 1.0*x**2 + 1.0  
    #return np.exp(-x**2)

def gq2L(a,b):
    d = (b-a)/2
    s = (b+a)/2
    x3nodes = np.array([-np.sqrt(3/5),0,np.sqrt(3/5)])  #x vector
    cvalues = np.array([5/9,8/9,5/9])  #c values 
    y3values = np.zeros(3)  #Initialize y vector
    G = 0
    if d == 1:  #d = 1 when [a,b]=[-1,1]. 
        for k in range(0,3):
            y3values[k]=f(x3nodes[k]) #Construct y vector
            G = G + cvalues[k]*y3values[k] #GQ3 summation
    elif d != 1:  #d not equal to 1
        for k in range(0,3):
            x3nodes[k] = d*x3nodes[k]+s  #Compute transformed x3 nodes
            y3values[k]=f(x3nodes[k])    #Compute transformed y values
            G = G + cvalues[k]*y3values[k] #GQ3 summation
    G = d*G   #Multiply by d, because dx = d*du from transformation
    
    #Output the GQ3 value to the screen:
    print(G)
    
    #The next section of code prepares for plotting
    #Sample f on n=20 x-values in [a,b] for later use as plot of f.  
    n = 20                     
    h = (b-a)/n                #Compute step size h.
    xvalues = np.zeros(n+1)    #Initialize x vector to be zeros
    yvalues = np.zeros(n+1)    #Initialize y vector to be zeros  
    for k in range(0,n+1):
        xvalues[k] = a + k*h          #Generate vector of x values
        yvalues[k] = f(xvalues[k])    #Generate vector of f(x) values
    
    #For GQ3 curve, compute deg2 Lagrange interpolating polyn (Eqn(3a), p.810) 
    #First compute denominators of Eqns (3b) on page 810 for Lk(x)    
    m = np.zeros(3)  
    m[0]=((x3nodes[0]-x3nodes[1])*(x3nodes[0]-x3nodes[2]))
    m[1]=((x3nodes[1]-x3nodes[0])*(x3nodes[1]-x3nodes[2]))
    m[2]=((x3nodes[2]-x3nodes[0])*(x3nodes[2]-x3nodes[1]))
    #Now compute Lk(x) values using Eqns (3b) on page 810 for Lk(x)
    L0 = np.zeros(n+1)  
    L1 = np.zeros(n+1)
    L2 = np.zeros(n+1)   
    for k in range(0,n+1):
        L0[k]= (xvalues[k]-x3nodes[1])*(xvalues[k]-x3nodes[2])/m[0]
        L1[k]= (xvalues[k]-x3nodes[0])*(xvalues[k]-x3nodes[2])/m[1]
        L2[k]= (xvalues[k]-x3nodes[0])*(xvalues[k]-x3nodes[1])/m[2]
    #Compute Lagrange interpolation polyn of deg 2 using Eqn (3a) on page 810.
    gq3curve = np.zeros(n+1)        
    for k in range(0,n+1):         
        gq3curve[k] = L0[k]*y3values[0] + L1[k]*y3values[1]+L2[k]*y3values[2]
        
    #Next enter in plot commands   
    plt.plot(xvalues,yvalues,'-',xvalues,gq3curve,'-',x3nodes,y3values,'o')   
    plt.xlabel('x')
    plt.legend(('f','GQ3 Curve','GQ3 Points'),loc = 0)
    plt.show()
    
           