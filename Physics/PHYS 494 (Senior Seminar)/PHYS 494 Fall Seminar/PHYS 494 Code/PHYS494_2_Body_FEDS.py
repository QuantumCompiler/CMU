#################### Libraries
import matplotlib.pyplot as plt

#################### Constants
G=6.67e-11 
M1=1.989*10**30
M2=6.39*10**23
AU=1.5e11 
DS=24.0*60*60 
GC=G*M1*M2 

#################### Initital Conditions
##### Mass 1 Parameters
x1=0.0
y1=0.0 
z1=0.0 
xv1=0.0
yv1=15.0 
zv1=0.0 

##### Mass 2 Parameters
x2=1.524*AU
y2=0.0 
z2=0.0 
xv2=0.0 
yv2=23996.0
zv2=0.0 

#################### Time-Step
t=0.0 
dt=1.0*DS 

#################### Lists
x1list=[] 
y1list=[] 
x2list=[] 
y2list=[] 

#################### Loop
while t<1.86*365.25*DS: #Time interval for plots of motion
    ##### Compute the Force
    rx=x2-x1 
    ry=y2-y1 
    rz=z2-z1 
    r3=(rx**2+ry**2+rz**2)**1.5 
    fx=-GC*rx/r3 
    fy=-GC*ry/r3 
    fz=-GC*rz/r3 
    ##### Update Quantities For 1
    xv1+=-fx*dt/M1 
    yv1+=-fy*dt/M1 
    zv1+=-fz*dt/M1 
    x1+=xv1*dt 
    y1+=yv1*dt 
    z1+=zv1*dt 
    ##### Update Quantities For 2
    xv2+=fx*dt/M2 
    yv2+=fy*dt/M2 
    zv2+=fz*dt/M2 
    x2+=xv2*dt 
    y2+=yv2*dt
    z2+=zv2*dt
    t+=dt
    ##### Save In Lists
    x1list.append(x1) 
    y1list.append(y1) 
    x2list.append(x2) 
    y2list.append(y2) 
    
#################### Plots
plt.plot(x1list,y1list,"-k",label='Sun',linewidth=2.0)
plt.plot(x2list,y2list,"-r",label='Mars',linewidth=1.0)
plt.axis("equal")
plt.title("2 Body System",size=10)
plt.xlabel("X-Position in Meters")
plt.ylabel("Y-Position in Meters")
plt.legend()
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
# V=29786.2
# R=1.0 AU
##### Mars
# M=6.39*10**23
# V=23996.0
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

