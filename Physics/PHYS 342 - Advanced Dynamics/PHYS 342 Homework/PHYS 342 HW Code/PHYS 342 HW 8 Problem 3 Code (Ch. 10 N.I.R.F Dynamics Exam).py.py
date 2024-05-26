#################### Libraries
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

#################### Equations
def model(IC,t,w):
    x, dx, y, dy = IC
    d2dx=(2*w*dy)
    d2dy=(-2*w*dx)
    f=[dx,d2dx,dy,d2dy]
    return f

#################### Omega
q=5.0

#################### Initial Conditions
X=10
DX=2
Y=10
DY=3
ic=[X,DX,Y,DY]

#################### Time Space
t=np.linspace(0,10,100)

#################### Solving ODE
y=odeint(model,ic,t,args=(q,),atol=1.0e-8, rtol=1.0e-6)

#################### Plots
plt.plot(t,np.sqrt((y[:,0])**2+(y[:,2])**2))
plt.title('r(t) vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Position of Ball')
plt.show()

