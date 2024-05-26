"""
This program uses the 2pt Gauss quadrature method (GQ2) to compute the calue of the area
of f(x) over [a,b] using 2 nodes.
The GQ2 linear plot is generated using y = y0 + m(x-x0) formula.

#User input: a, b

@author: Phil
"""
######################### Libraries
import numpy as np
import matplotlib.pyplot as plt
######################### Program
def f(x):
    return 1.0*x**2 + 1.0
    #return np.exp(-x**2)

def gq2(a,b):
    d = (b-a)/2
    s = (b+a)/2
    cvalues = np.array([1,1])   #c values
    if d==1: #d = 1 when [a,b]=[1,-1]. The == is the logic command for equals
        x2nodes = np.array([-1/np.sqrt(3),1/np.sqrt(3)])    #x node vector
        y2values = np.array([f(x2nodes[0]),f(x2nodes[1])])  #y value vector
        G = cvalues[0]*y2values[0] + cvalues[1]*y2values[1] #GQ2 summation
    elif d !=1: #d not equal to 1
        x2nodes = d*np.array([-1/np.sqrt(3),1/np.sqrt(3)])+s    #transformed x nodes
        y2values = np.array([f(x2nodes[0]),f(x2nodes[1])])  #tansformed y vector
        G = cvalues[0]*y2values[0] + cvalues[1]*y2values[1]     #GQ2 summation
    G = d*G     #Multiply by d, because dx = d*du from transformation
    
    #Output the GQ2 value to the screem:
    print(G)
    
    #Next, we sample f on n=20 x values in [a,b] and plot f & GQ2 line
    n = 20
    h = (b-a)/n                 #Compute step size h.
    xvalues = np.zeros(n+1)     #Initialize x vector to be zeros
    yvalues = np.zeros(n+1)     #Initialize y vector to be zeros
    gqline = np.zeros(n+1)      #Initialize GQ2 line values
    m = (y2values[1]-y2values[0]/(x2nodes[1]-x2nodes[0]))   #Slope of GQ2 line
    
    for k in range(0,n+1):
        xvalues[k] = a + k*h        #Generate vector of x values
        yvalues[k] = f(xvalues[k])  #Generate vector of f(x) values
        gqline[k] = y2values[0] + m*(xvalues[k]-x2nodes[0]) #GQ2 line values
        
    plt.plot(xvalues,yvalues,'-',xvalues,gqline,'-',x2nodes,y2values,'o')
    plt.xlabel('x')
    plt.legend(('f','GQ2 Line','GQ2 Points'),loc = 0)
    plt.show()
        

