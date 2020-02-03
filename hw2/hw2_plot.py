import numpy as np
from sympy import *
import matplotlib
import matplotlib.pyplot as plt
import os

matplotlib.rc('text', usetex=True)

def plot_cobwebbing_successive(x0, fun, x_bar, title, total=20):
    """ Use the cobwebbing method to plot a higher-order difference equation
    Args:
        x0: initial value
        f: the function describing the mapping: x_n+1 = f(x_n)
        x_bar: the steady state
        title: the title of the figure to save
    """
    x = np.arange(0, total); y = [x0]
    for i in range(total-1):
        y.append(fun(y[i]))
    plt.figure()
    plt.plot(x, y, '--o')
    plt.xticks(range(0, total+1, total//20))
    plt.xlabel("$n$")
    plt.ylabel("$x_{n}$")
    plt.axhline(x_bar, color="magenta")
    file_name = rf"./fig/{title}.pdf"
    if os.path.isfile(file_name):
        os.remove(file_name)
    plt.savefig(file_name)

def plot_cobwebbing(x0, fun, x_bar, title, total=20, x_range=None):
    y = [x0]
    for i in range(total-1):
        y.append(fun(y[i]))
    x = symbols('x')
    zeros = solve(fun(x)-x, x)
    delta = max(abs(min(zeros)), abs(max(zeros)))
    if x_range is not None:
        x = x_range
    else:
        x = np.arange(-delta, delta, 0.01)
    y1 = list(map(lambda x: fun(x), x))
    # Create new figure object
    plt.figure()
    # Plot x_{n+1} = x_n and x_{n+1} = f(x_n)
    plt.plot(x, y1)
    plt.plot(x, x)
    # Plot cobwebbing part
    plt.plot([x0, x0], [0, x0], 'r', lw=1)
    for i in range(0, len(y)-1):
        plt.plot([y[i], y[i]], [y[i], y[i+1]], color='r', lw=1)
        plt.plot([y[i], y[i+1]], [y[i+1], y[i+1]], color='r', lw=1)
    # Formatting
    # Annotate x_0
    ticks, label = plt.xticks()
    delta = ticks[1] - ticks[0]
    plt.plot(x0, 0, 'mo', markersize=3)
    plt.annotate(r"$x_0$", xy=(x0, 0), xytext=(x0+0.5*delta, 0),
            arrowprops=dict(arrowstyle="->", color="magenta"), color="magenta")
    # Annotate x_bar
    ticks, label= plt.yticks()
    del label
    interval = ticks[1] - ticks[0]
    plt.plot(x_bar, x_bar, 'go', markersize=3, zorder=10)
    plt.annotate(r"$\bar x$", xy=(x_bar, x_bar), 
            xytext=(x_bar, x_bar+0.5*interval),
            arrowprops=dict(arrowstyle="->", color="green"), color="green")
    # Annotate x_end
    plt.plot(y[-2], y[-1], 'bo', markersize=3, zorder=10)
    plt.annotate(f"$x{len(y)-1}$", xy=(y[-2], y[-1]), 
            xytext=(y[-2]-0.3*delta, y[-1]+0.4*interval),
            arrowprops=dict(arrowstyle="->", color="blue"), color="blue")
    # Custom legend
    plt.legend(['$x_{n+1} = f(x_n)$', '$x_{n+1} = x_n$'])
    # Savefig
    file_name = rf"./fig/{title}.pdf"
    if os.path.isfile(file_name):
        os.remove(file_name)
    plt.savefig(file_name)

def plot_logis_lambda(r, K):
    x = np.arange(2*K)
    y = list(map(lambda x: pow(np.e, r*(1-x/K)), x))
    plt.figure()
    plt.plot(x, y)
    plt.xlabel("$N$")
    plt.ylabel(r"$\lambda$")
    plt.axvline(K, linestyle='--', color='r')
    ytick, fig = plt.yticks()
    xtick, fig = plt.xticks()
    y_mid = ytick[len(ytick)//2+1]
    x_int = xtick[1] - xtick[0]
    del fig, xtick, ytick
    plt.text(K+0.1*x_int, y_mid, 'N = K',
            rotation=-90, fontsize=12, color="red")
    plt.axhline(1, xmax=0.5, linestyle='--', color='r', label=r"$\lambda = 1$")
    plt.plot(K, 1, 'ro')
    plt.savefig(r"./fig/fig4(a).pdf")

def plot_CO2_sensitivity():
    x = np.arange(0, 200)
    K = 50
    def fun(l, C):
        return 1/((K**l/C**l) + 1)
    plt.figure()
    plt.gcf().subplots_adjust(left=0.15)
    for l in range(0, 3):
        y = list(map(lambda x: fun(l, x), x))
        plt.plot(x, y)
    plt.yticks( np.arange(0, 1.1, 0.1),
        labels=[f"${x:.1f}Vmax$" for x in np.arange(0, 1.1, 0.1)])
    plt.xlabel("C")
    plt.ylabel("S(C)")
    plt.legend(["l = 0", "l = 1", "l = 2"], loc="best")
    plt.savefig(r"./fig/fig17(f).pdf")

def main():
    plot_cobwebbing_successive(
        0.01,
        lambda x: 2*x*(1-x),
        0,
        "fig2(a)(1)",
    )
    plot_cobwebbing_successive(
        0.5,
        lambda x: 0.5*x*(1-x),
        0,
        "fig2(a)(2)",
    )
    plot_cobwebbing_successive(
        1.6,
        lambda x: -(x**2)*(1-x),
        (1+np.sqrt(5))/2,
        "fig2(b)"
    )
    plot_cobwebbing_successive(
        1,
        lambda x: 1/(2+x),
        np.sqrt(2)-1,
        "fig2(c)",
    )
    plot_cobwebbing_successive(
        1.648,
        lambda x: x*(np.log(x*x)),
        np.e**0.5,
        "fig2(d)",
    )
    # plot_logis_lambda(2, 50)

if __name__ == "__main__":
    main()