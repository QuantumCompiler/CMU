#################### Libraries
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

#################### Equations
def model(IC,t,L):
    r,dr,z,dz,o,do=IC
    a=1.0
    m=1.0
    g=9.81
    d2dr2=r*do**2-2*(r/m)*L
    d2dz2=L*(a/m)-g
    d2do2=-(2*dr*do)/r
    f=[dr,d2dr2,dz,d2dz2,do,d2do2]
    return f

#################### Lambda Paramter
k=9.81

#################### Initial Conditions
R=4
DR=0.01
Z=5
DZ=0
O=10
DO=0
ic=[R,DR,Z,DZ,O,DO]

#################### Time Interval
t=np.linspace(0,10,1000)

#################### Solution to ODE
y=odeint(model,ic,t,args=(k,),atol=1.0e-8,rtol=1.0e-6)

#################### Plots
##### r(t)
plt.plot(t,y[:,0])
plt.title('r(t) vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('r in Meters')
plt.show()

##### o(t)
plt.plot(t,y[:,4])
plt.title('Theta(t) vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Theta in Radians')
plt.show()

##### z(t)
plt.plot(t,y[:,0]**2)
plt.title('z(t) vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('z in Meters')
plt.show()



