"""
This program uses Newton's interpolation method to compute the value of the
interpolating polynomial at the user input value x.

@Author: Taylor Larrechea
"""
######################### Libraries
import numpy as np
import matplotlib.pyplot as plt

######################### Program
def beetlejuice(x):
    xdata = np.array([8.0,9.0,9.5,11.0]) #This is the X-Data
    N = len(xdata) #N = number (length) of xdata points
    ydata=np.zeros(N)
    
    for k in range(0,N): #This loop creates ydata using ln(x)
        ydata[k] = np.log(xdata[k])
        
    a = ydata.copy() #Creat a = copy of ydata
    for k in range(1,N): #k = column number of divided diffs
        for i in range(k,N): #Create column vector of divided diffs
            a[i]=(a[i]-a[k-1])/(xdata[i]-xdata[k-1])
            
    p = a[N-1] #Nested computation of p(x)
    for k in range(2,N+1):
        p = (x-xdata[N-k])*p + a[N-k]
        
    solution = p,a
    print(solution)
    
    xp = np.array([x]) #Put the x value in as a length 1 array
    yp = np.array([p]) #Put the y value for p in as a length 1 array
    plt.plot(xdata,ydata,'-o',xp,yp,'s') #Plot array ordered pairs: s = square
    plt.xlabel('x')
    plt.legend(('Data','Point Value'), loc = 0)
    plt.show()
    
        