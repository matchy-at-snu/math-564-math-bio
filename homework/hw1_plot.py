#%%
import matplotlib
matplotlib.rcParams['text.usetex'] = True
import matplotlib.pyplot as plt
import numpy as np
import mpl_toolkits.axisartist as axisartist
import math
import os

os.chdir(".")
path=""

#%%
def plot_closed_form(r1, r2, a1=1, a2=1, n=10, name="default"):
    """
    Plot the graph for the solution of a difference equation
        x_n = a1*(r1)^n + a2*(r2)^n
    param:
        r1: eigenvalue1, required
        r2: eigenvalue2, required (could be the same as r1)
        a1: coefficient for eigenvalue1, default=1
        a2: coefficient for eigenvalue2, default=1
        n:  range of n, default=100
    """
    x = np.arange(0, n+1, 1)
    if (r1 == r2):
        y = list(map(lambda x: a1*(r1**x) + a2*(x*(r2**x)), x))
    else:
        y = list(map(lambda x: a1*(r1**x) + a2*(r2**x), x))

    plt.xlabel("n")
    plt.ylabel(rf"$x_n = {a1} \cdot ({r1})^n + {a2} \cdot ({r2})^n$")
    plt.xticks(x)
    plt.plot(x, y, "o--")
    locs, labels = plt.yticks()
    del labels
    interval = locs[1] - locs[0]
    for i_x, i_y in zip(x, y):
        plt.text(i_x, i_y+0.2*interval, f'{i_y}')
    plt.savefig(path+name)
    plt.cla()
    plt.clf()

#%%
# fig2(a)
plot_closed_form(2, 3, name='fig2(a).pdf')

#%%
# fig2(c)
plot_closed_form(-1, 1, a2=4, name='fig2(c).pdf')

#%%
# fig2(e)
plot_closed_form(-2, 1, a2=5, name='fig2(e).pdf')

#%%
# fig3(b)(ii), take A_1 = 1 & A_2 = 1
x = np.arange(0, 11, 1)
y = list(map(lambda x: 1+x, x))
plt.xlabel("n")
plt.ylabel(rf"$x_n = (1)^n + n \cdot (1)^n$")
plt.xticks(x)
plt.plot(x, y, "o--")
locs, labels = plt.yticks()
interval = locs[1] - locs[0]
for i_x, i_y in zip(x, y):
    plt.text(i_x, i_y+0.2*interval, f'{i_y}')
plt.savefig(path+'fig3(b)(ii).pdf')
plt.cla()
plt.clf()

#%%
def plot_complex_value(a, b, name='default'):
    """
    Plot a complex number 'z' on the complex plane, as well as z^n, for n in
    range(0, 5) = {0, 1, 2, 3, 4}
    """
    z = complex(a, b)
    n = np.arange(0, 5, 1)
    cnums = list(map(lambda n: pow(z, n), n))
    x = [z.real for z in cnums]
    y = [z.imag for z in cnums]
    x_range = max(map(lambda x: abs(x), x))
    y_range = max(map(lambda y: abs(y), y))
    if abs(y_range - x_range )> 100:
        x_range = y_range = max(x_range, y_range)
    x_intr  = x_range/4
    y_intr  = y_range/4
    fig = plt.figure()
    # create new floating axis
    ax = axisartist.Subplot(fig, 1,1,1)
    fig.add_axes(ax)
    ax.scatter(x, y, zorder=4)
    for z in cnums:
        ax.arrow(0, 0, z.real, z.imag, color="lightsteelblue", zorder=3, lw=1.5)
        ax.text(
            z.real+0.1*x_intr,
            z.imag+-0.5*y_intr,
            rf"$z^{cnums.index(z)}$ ",
            weight="extra bold",
            zorder=4)
    ax.axis[:].set_visible(False)
    ax.axis["x"] = ax.new_floating_axis(0, 0)
    ax.axis["y"] = ax.new_floating_axis(1, 0)
    ax.axis["x"].set_axis_direction("top")
    ax.axis["x"].set_axisline_style("-|>")
    ax.axis["y"].set_axisline_style("-|>")
    ax.axis["y"].set_axis_direction("left")
    ax.set_xticks(np.arange(-x_range, x_range+0.1, x_intr))
    ax.set_yticks(np.arange(-y_range, y_range+0.1, y_intr))
    # ax.set_xlim(-1.1*x_range, x_range*1.1)
    # ax.set_ylim(-1.1*y_range, y_range*1.1)
    fig.savefig(path+''+name, foramt='svg')
    fig.clf()

#%%
plot_complex_value(1, 1, name='fig8(a).pdf')

#%%
plot_complex_value(1, -1, name='fig8(b).pdf')

#%%
plot_complex_value(0, 10, name='fig8(c).pdf')

#%%
import math
plot_complex_value(-1, math.sqrt(3), name='fig8(d).pdf')

#%%
plot_complex_value(-0.5, -0.5, name='fig8(e).pdf')

#%%
def plot_real_valued_solution(theta, c1=1, c2=1, name='default.pdf'):
    x = np.arange(0, 11, 1)
    y = list(map(
        lambda x : c1*np.cos(x*np.pi*theta) + c2*np.cos(x*np.pi*theta),
        x
    ))
    plt.xlabel("n")
    plt.ylabel(rf"$x_n = {c1}(\cos(n \pi {theta:.3})) + (\sin(n \pi {theta:.3}))$")
    plt.xticks(x)
    plt.plot(x, y, "o--")
    locs, labels = plt.yticks()
    del labels
    interval = locs[1] - locs[0]
    for i_x, i_y in zip(x, y):
        plt.text(i_x, i_y+0.2*interval, f'{i_y:.2}')
    plt.savefig(path+''+name)
    plt.cla()
    plt.clf()

plot_real_valued_solution(0.5,name='fig9(a).pdf')
plot_real_valued_solution(1/3, name='fig9(b).pdf')