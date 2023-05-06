#################### Libraries
import numpy as np
import matplotlib.pyplot as plt

#################### l^2=uk Lets call it Plot A
theta1=np.linspace(0,10.100)
U1=2*theta1+5

#################### l^2>uk Lets call it Plot B
theta2=np.linspace(0,15,150)
U2=2*np.exp(np.sqrt(10-1)*theta2)+5*np.exp(-np.sqrt(10-1)*theta2)

#################### l^2<uk Lets call it Plot C
theta3=np.linspace(0,20,200)
U3=2*np.exp(np.sqrt(8+1)*theta3)+5*np.exp(-np.sqrt(8+1)*theta3)

#################### Plot of l^2=uk
plt.plot(theta1,U1)
plt.title('l^2=uk Case')
plt.xlabel('Value of Theta in Radians')
plt.ylabel('Value of Eq. (i)')
plt.show()

#################### Plot of l^2>uk
plt.plot(theta2,U2)
plt.title('l^2>uk Case')
plt.xlabel('Value of Theta in Radians')
plt.ylabel('Value of Eq. (ii)')
plt.show()

#################### Plot of l^2<uk
plt.plot(theta3,U3)
plt.title('l^2<uk Case')
plt.xlabel('Value of Theta in Radians')
plt.ylabel('Value of Eq. (iii)')
plt.show()

