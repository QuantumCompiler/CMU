############### Imports
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

############### Equations
def model(IC,t,w):
    r, dr, o, do = IC
    g=9.81
    d2dr = (-4*r*dr**2-2*g*r+r*(do+w)**2)/(1+4*r**2)
    d2do =(-2/r)*(do*dr+w*dr)
    f=[dr,d2dr,do,d2do]
    return f

############### Omega
p=np.sqrt(2*9.81)+0.1
    
############### Intial Condtions
R=5
DR=0
O=5
DO=0
ic=[R,DR,O,DO]

############### Time Space
t=np.linspace(0,45,4500)

############### Solution to ODE
y=odeint(model,ic,t,args=(p,), atol=1.0e-8, rtol=1.0e-6)

############### Plots
############### r(t)
plt.plot(t,y[:,0])
plt.title('r(t) vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Position in Meters')
plt.show()

############### o(t)
plt.plot(t,y[:,2])
plt.title('Theta(t) vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Theta')
plt.show()

############### z(t)
plt.plot(t,(y[:,0])**2)
plt.title('Height Z. Vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Position in Meters')
plt.show()