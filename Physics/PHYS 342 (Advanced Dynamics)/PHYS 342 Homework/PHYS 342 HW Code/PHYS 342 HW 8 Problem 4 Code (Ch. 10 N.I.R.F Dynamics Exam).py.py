#################### Libraries
import matplotlib.pyplot as plt
import numpy as np
from scipy.integrate import odeint

#################### Equations of motion
def model(IC,t,w):
    x, dx, y, dy = IC
    d2dx=w**2*x+2*w*dy
    d2dy=w**2*y-2*w*dx
    f=[dx,d2dx,dy,d2dy]
    return f

#################### Omega
q=7.5

#################### Initial Conditions
X=10
DX=0
Y=10
DY=1
ic=[X,DX,Y,DY]

#################### Time Space
t=np.linspace(0,10,100)

#################### Solving the ODE
y=odeint(model,ic,t,args=(q,),atol=1.0e-8,rtol=1.0e-6)

#################### Plots
##### x(t)
plt.plot(t,y[:,0])
plt.title('X(t) Versus Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Y-Position in Meters')
plt.show()

##### y(t)
plt.plot(t,y[:,2])
plt.title('Y(t) Versus Time')
plt.xlabel('Time in Seconds')
plt.ylabel('X-Position in Meters')
plt.show()

##### r(t)
plt.plot(t,np.sqrt(y[:,0]**2+y[:,2]**2))
plt.title('R(t) Versus Time')
plt.xlabel('Time in Seconds')
plt.ylabel('R(t) in Meters')
plt.show()


