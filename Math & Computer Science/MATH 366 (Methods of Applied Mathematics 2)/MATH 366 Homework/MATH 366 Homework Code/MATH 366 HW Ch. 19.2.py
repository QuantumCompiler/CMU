#################### Libraries
import numpy as np

""" This program computes the solutions x1, x2, of ax^2 + bx + c = 0
in a way that minimizes the effects of cancellation.

We will assume that b is nonzero and b^2-4ac > 0.
The case b=0 is easy to solve, as is the case b^2 - 4ac = 0.
The case b^2 - 4ac < 0 involves complex roots, which is outside
our immediate scope of study. """

#################### Program
def qformula(a,b,c):
    d=np.sqrt(b**2-4*a*c) #Compute square root of discriminant
    x1,x2 = 0,0 #Initialize values for x1, x2
    test=(4*a*c)/b**2 #Test will determine if b^2 >> 4ac
    eps=0.1
    if test > eps:
        x1=(-b+d)/(2*a) #Use standard formula for x1
        x2=(-b-d)/(2*a) #Use standard formula for x2
        Loop=1
        
    elif test <= eps:
        if b>0:
            x2=(-b-d)/(2*a) #Use standard formula for x1
            x1=c/(a*x2) #Use alternative formula for x2
            Loop = 2
        elif b<0:
            x1=(-b+d)/(2*a) #Use standard formula for x1
            x2= c/(a*x1) #Use alternative formula for x2
            Loop = 3
    solution=np.array([Loop,x1,x2])
    print(solution)

