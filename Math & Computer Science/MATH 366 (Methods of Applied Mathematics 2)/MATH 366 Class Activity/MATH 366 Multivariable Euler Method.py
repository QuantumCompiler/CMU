"""
This program implements the Euler Method for solving a second order ODE as a 
as a system of two ODES.
User input:
    x0 = initial x value
    y0 = initial y value
    yp0 = initial derivative value
    h = step size
    N = number of iterations
"""
import numpy as np
import matplotlib.pyplot as plt

def ye1(x):             #Exact solution y1 to ODE
    return 2.0*np.exp(-0.5*x)+np.exp(-1.5*x)

def ye2(x):             #Exact solution y1 to ODE
    return -1.0*np.exp(-0.5*x)-1.5*np.exp(-1.5*x)

def fe213(y,z):         #f is the formula for y2'
    return -2.0*y-0.75*z

def euler213(x0,y0,yp0,h,N):    #Euler Method
    xn = np.zeros(N+1)          #Initialize x nodes
    y1n = np.zeros(N+1)         #Initialize Euler y1n nodes
    y2n = np.zeros(N+1)         #Initialize Euler y2n nodes
    y1 = np.zeros(N+1)          #Initialize Exact y1 values
    y2 = np.zeros(N+1)          #Initialize Exact y2 values
    xn[0] = x0
    y1n[0] = y0
    y2n[0] = yp0
    y1[0] = y0
    y2[0] = yp0
    for k in range(1,N+1):
        xn[k] = xn[k-1] + h
        y1n[k] = y1n[k-1] + h*y2n[k-1]
        y2n[k] = y2n[k-1] + h*fe213(y2n[k-1],y1n[k-1])
        y1[k] = ye1(xn[k])
        y2[k] = ye2(xn[k])
        
    print('Euler y1 =', y1n)
    print('Exact y1 =', y1)
    print('Euler y2 =', y2n)
    print('Exact y2 =', y2)
    
    #Next, we sample the solutions on n=100 x values and plots
    n=100
    xvalues=np.zeros(n+1)       #Intialize x vector to be zeros
    y1values=np.zeros(n+1)      #Intialize y1 vector to be zeros
    y2values=np.zeros(n+1)      #Intialize y2 vector to be zeros
    
    step = (xn[N]-x0)/n         #Use this step to get xinterval = [x0,xn(N)]
    for k in range(0,n+1):
        xvalues[k] = x0 + k*step        #Generate vector of x values   
        y1values[k] = ye1(xvalues[k])   #Generate vector of y1(x) values
        y2values[k] = ye2(xvalues[k])   #Generate vector of y2(x) values
        
    plt.figure()
    plt.subplot(2,1,1)
    plt.plot(xvalues,y1values,'-b',xn,y1n,'o--k')
    plt.xlabel('x')
    plt.legend(('Exact y1','Euler'),loc=0)
    
    plt.subplot(2,1,2)
    plt.plot(xvalues,y2values,'-b',xn,y2n,'o--k')
    plt.xlabel('x')
    plt.legend(('Exact y2','Euler'),loc=0)
    
    plt.show()


