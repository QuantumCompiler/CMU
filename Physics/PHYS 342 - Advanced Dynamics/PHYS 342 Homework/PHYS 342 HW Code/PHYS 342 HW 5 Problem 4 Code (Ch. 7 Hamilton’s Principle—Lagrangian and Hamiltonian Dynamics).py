############### Imports
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

############### Equations
def model(IC,t,b):
    l, dl, o, do = IC
    g=9.81
    k=2.00
    m=5.00
    d2dl = (l+b)*do**2-k/m*l-g*np.cos(o)
    d2do = (-do*(2*l*dl+2*b*dl)-g*(l+b)*np.sin(o))/(l**2+2*l*b+b**2)
    f=[dl,d2dl,do,d2do]
    return f

############### Unextended length
q=5

############### Initial Conditions
L=5
DL=5
O=np.pi/4
DO=np.pi/6
ic=[L,DL,O,DO]

############### Time Space
t=np.linspace(0,10,1000)

############### Solution to ODE
y=odeint(model,ic,t,args=(q,),atol=1.0e-8,rtol=1.0e-6)

############### Plots
############### l(t)
plt.plot(t,y[:,0])
plt.title('Extension Length vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Extension of Spring')
plt.show()

############### o(t)
plt.plot(t,y[:,1])
plt.title('Theta vs. Time')
plt.xlabel('Time in Seconds')
plt.ylabel('Theta')
plt.show()

############### l(t) vs. dldt
plt.plot(y[:,0],y[:,1])
plt.title('Extension Length vs. Rate of Change of Extension Length')
plt.xlabel('Rate of Change of Extension Length')
plt.ylabel('Extension Length')
plt.show()

############### o(t) vs. dodt
plt.plot(y[:,2],y[:,3])
plt.title('Angle vs. Rate of Change of Angle')
plt.xlabel('Rate of Change of Angle')
plt.ylabel('Angle')
plt.show()
