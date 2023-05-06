######################### Comments]
"""
This program uses the trapezoid method (T-rule) to compute the value of the area
of f(x) over [a,b] using n trapezoids.

#User input: a, b, and n

@author: Taylor
"""

######################### Libraries
import numpy as np
import matplotlib.pyplot as plt

######################### Program
##### Function
def f(x): #<------------------- This is the function wished to integrate #
    return 1.0*x**2+1.0
    #return np.exp(-x**2)
##### Trapezoid Rule
def trapezoid(a,b,n):
    
    h = (b-a)/n             #Compute step size h.
    nodes=np.zeros(n+1)     #Initialize node vector to be zeros
    yvalues=np.zeros(n+1)   #Initialize yvalue vector to be zeros
    
    T = 1/2*(f(a)+f(b))             #Compute first and last values of T-rule
    for k in range(0,n+1):
        nodes[k] = a + k*h          #Generate vector of node values
        yvalues[k] = f(nodes[k])    #Generate vector of f(x) values at nodes
    for k in range(1,n):
        T = T + f(nodes[k])         #Compute the middle part of the T-rule
        
    T = h*T                         #Multiply by h at very end
    print(T)
    
##### Plots
    plt.plot(nodes,yvalues,'-o')
    plt.xlabel('x')
    plt.legend(('f'),loc=0)
    plt.show()


