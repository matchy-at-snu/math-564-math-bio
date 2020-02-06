import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import operator
matplotlib.rc('text', usetex=True)
# --------------------------------------------------------------------------- #

# Initial values

S0 = 2000
C0 = 20

B_uk = B_3rd = 72

f = 0.3 *10**(-4)

S_uk = [S0]
S_3rd = [S0]

C_uk = [C0]
C_3rd = [C0]

# --------------------------------------------------------------------------- #

time = 20
x = range(0, time+1)
for i in range(time):
    C_uk.append(C_uk[i]*S_uk[i]*f)
    S_uk.append(S_uk[i] - C_uk[i+1] + B_uk)
    C_3rd.append(C_3rd[i]*S_3rd[i]*f)
    S_3rd.append(S_3rd[i] - C_3rd[i+1] + B_3rd)


plt.figure()
plt.plot(x, C_uk, '--o', markersize=3)
plt.plot(x, S_uk, '--o', markersize=3)
plt.legend(['Case:UK','Susceptible:UK'])
plt.figure()
plt.plot(x, C_3rd, '--o', markersize=3)
plt.plot(x, S_3rd, '--o', markersize=3)
plt.legend(['Case:3rd world','Susceptible:3rd world'])
plt.show()