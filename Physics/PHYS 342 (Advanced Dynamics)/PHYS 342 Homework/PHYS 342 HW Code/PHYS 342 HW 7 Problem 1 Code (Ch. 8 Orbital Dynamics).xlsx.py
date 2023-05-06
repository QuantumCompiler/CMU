#################### Libraries
import matplotlib.pyplot as plt
import numpy as np

#################### Constants
G=6.67e-11 
Ma=1.989*10**30 
Mb=5.972*10**24
AU=1.5e11 
DS=24.0*60*60 
GC=G*Ma*Mb 

#################### Initital Conditions
##### Mass a Parameters
xa=0.0 
ya=0.0 
za=0.0 
xva=0.0
yva=1.0
zva=0.0 

##### Mass b Parameters
xb=1.0*AU 
yb=0.0 
zb=0.0 
xvb=0.0
yvb=30000
zvb=0.0 

#################### Time-Step
t=0.0 
dt=0.01*DS 

#################### Lists
xalist=[] 
yalist=[] 
xblist=[] 
yblist=[]
Elist=[] 

#################### Loop
while t<(365.25)*10*DS: #Time interval for plots of motion
    ##### Compute the Force
    rx=xb-xa 
    ry=yb-ya 
    rz=zb-za 
    r3=(rx**2+ry**2+rz**2)**1.5 
    fx=-GC*rx/r3 
    fy=-GC*ry/r3 
    fz=-GC*rz/r3 
    ##### Update Quantities For a
    xva+=-fx*dt/Ma 
    yva+=-fy*dt/Ma 
    zva+=-fz*dt/Ma 
    xa+=xva*dt 
    ya+=yva*dt 
    za+=zva*dt 
    t+=dt
    ##### Update Quantities For b
    xvb+=fx*dt/Mb 
    yvb+=fy*dt/Mb 
    zvb+=fz*dt/Mb 
    xb+=xvb*dt 
    yb+=yvb*dt 
    zb+=zvb*dt
    ##### Energy of System
    G=6.67e-11 
    Ma=1.989*10**30 
    Mb=5.972*10**24
    E=(G*Ma*Mb)/(np.sqrt(rx**2+ry**2+rz**2))-0.5*(Mb)*(np.sqrt(xvb**2+yvb**2))**2
    ##### Save In Lists
    xalist.append(xa) 
    yalist.append(ya) 
    xblist.append(xb) 
    yblist.append(yb)
    Elist.append(E)
    
#################### Plots
plt.plot(xalist,yalist,"-y",label='The Sun',linewidth=2.0)
plt.plot(xblist,yblist,"-b",label='The Earth',linewidth=1.0)
plt.axis("equal")
plt.title("Earth Orbiting The Sun (Orbits)",size=10)
plt.xlabel("X-Position in Meters")
plt.ylabel("Y-Position in Meters")
plt.legend()
plt.show()


plt.plot(Elist)
plt.title("Energy of System Over One Years Time", size=10)
plt.xlabel("Time Span of One Year")
plt.ylabel("Energy in Joules")
plt.show()

#################### Planets
##### Mercury
# M=3.285*10**23
# V=47400
# R=0.39 AU
##### Venus
# M=4.867*10**24
# V=35000
# R=0.723 AU
##### Earth
# M=5.972*10**24
# V=30000
# R=1.0 AU
##### Mars
# M=6.39*10**23
# V=24100
# R=1.524 AU
##### Jupiter
# M=1.898*10**27
# V=13100
# R=5.2 AU
##### Saturn
# M=5.683*10**26
# V=9600
# R=9.6 AU
##### Uranus
# M=8.681*10**25
# V=6800
# R=19.2 AU
##### Neptune
# M=1.024*10**26
# V=5430
# R=30.1 AU
##### Pluto
# M=1.309*10**22
# V=4740
# R=29 AU
##### Sun
# M=1.989*10**30

