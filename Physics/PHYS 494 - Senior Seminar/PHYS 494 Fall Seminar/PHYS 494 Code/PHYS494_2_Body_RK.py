#################### Libraries
import matplotlib.pyplot as plt

#################### Constants
G=6.67e-11 
M1=1.989*10**30
M2=1.309*10**22
AU=1.5e11 
DS=24.0*60*60 
GC=G*M1*M2 

#################### Force Equation's
##### Force in the X
def xforce(x, y, z, r):
    x=x2-x1 
    y=y2-y1 
    z=z2-z1 
    r=(x**2+y**2+z**2)**1.5 
    return -GC*x/r 

##### Force in the Y
def yforce(x, y, z, r):
    x=x2-x1 
    y=y2-y1 
    z=z2-z1 
    r=(x**2+y**2+z**2)**1.5 
    return -GC*y/r 

##### Force in the Z
def zforce(x, y, z, r):
    x=x2-x1 
    y=y2-y1 
    z=z2-z1 
    r=(x**2+y**2+z**2)**1.5 
    return -GC*z/r

#################### Runge Kutta Solver


#################### Initital Conditions
##### Mass a Parameters
x1=0.0 
y1=0.0 
z1=0.0 
xv1=0.0
yv1=0.0 
zv1=0.0 

##### Mass b Parameters
x2=0.0
y2=0.0 
z2=0.0 
xv2=0.0 
yv2=0.0
zv2=0.0 

#################### RK Solver
