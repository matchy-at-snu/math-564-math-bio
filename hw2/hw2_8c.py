import numpy as np
import matplotlib
import matplotlib.pyplot as plt
matplotlib.rc('text', usetex=True)

def plot_function(lb, b, num, lim=None):
    if lim == None:
        lim = 20
    x = np.arange(0, lim+1, 1)
    y = [5]
    fun = lambda x: lb*x*(1 + x)**(-b)
    for i in range(lim):
        y.append(fun(y[i]))
    x_f = np.arange(-lim, 2*lim, 0.1)
    y_f = []
    for i in range(len(x_f)):
        y_f.append(fun(x_f[i]))
    plt.figure()
    plt.plot(x, y, '--o', lw=1, markersize=3)
    cond = b*(1-lb**(-1/b))
    if lb < 1:
        plt.text(0.9*max(x), 0.9*max(y),r'$\lambda < 1$')
        plt.axhline(0, color="magenta")
        plt.text(0.68*max(x), 0.8*max(y),r"Steady state: $N_t = 0$")
    if cond < 2 and cond > 0:
        plt.text(0.7*max(x), 0.9*max(y), r'$0 < b(1-\lambda^{-1/b})<2$')
        steady = (lb**(1/b)-1)
        plt.axhline(steady, color="magenta")
        plt.text(0.5*max(x), 0.8*max(y), r'Steady state: $N_t = (\lambda^{1/b} - 1)/a =$'+
                f"{steady:.4}")
    plt.legend([r'$\lambda = $' + str(lb) + r', $b = $' + str(b)])
    plt.savefig(rf"./fig/fig8(c)({num}).pdf")
    plt.figure()
    plt.plot(x_f, y_f, color="orange")
    plt.show()
    
def main():
    plot_function(0.5, 2, num=1)
    plot_function(0.1, -0.5, num=2)
    plot_function(2, 3, num=3)
    plot_function(1.2, -1, lim=10, num=4)

if __name__ == "__main__":
    main()