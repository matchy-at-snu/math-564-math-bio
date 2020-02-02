# math-bio

Homework repository for [MATH564 MATH MODELING](https://www.coursicle.com/unc/courses/MATH/564/) @ [UNC-Chapel Hill](https://www.unc.edu/)

## Brief $\LaTeX$ reference

### Two modes in latex that can typeset the formulations

1. **Inline mode**, start with an `$`, end with an `$` (`$...$`). E.g. $a + b = \frac{1}{3}$
2. **Display mode**, start with two `$$`, end with two `$$` (`$$...$$`), or  E.g. $$a+b=\frac{1}{3}$$

The `\(...\)` and `\[...\]` can also start inline mode math and display mode math, respectively. We recommend using `$...$` for inline mode delimiter and `\[...\]` for displaymode delimiter, for clearer distinction.

### Basic Maths

1. It is straight-forward for basic arithmetic operations. E.g. $+, - * /, a^b, a_b$.
2. $\LaTeX$ already defined many useful symbols, macros, (or functions) to typeset the formulations. They start with \, such as \LaTeX is for the latex symbol. In some typeset functions you can give them parameters. E.g. \frac{1}{3} typesets one over three, where the thing within the first {} is nominator, and the thing within the second {} is denominator. {} also helps group thing within it together. Consider the difference between a\_b+1 ($a_b+1$) and a\_{b+1} ($a_{b+1}$)

### Useful symbols and functions



|                               | code                                                              | effect                                                           |
| ----------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------- |
| fraction                      | `\frac{1}{3}`                                                     | <img src="https://render.githubusercontent.com/render/math?math=\frac{1}{3}>                                                    |
| summation                     | `\sum_{i=1}^{N}`                                                  | <img src="https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{N}>                                                 |
| products                      | `\prod_{i=1}^{N}`                                                 | <img src="https://render.githubusercontent.com/render/math?math=\prod_{i=1}^{N}>                                                |
| indexing                      | `w_{i, j}`                                                        | <img src="https://render.githubusercontent.com/render/math?math=w_{i, j}>                                                       |
| frequently used Greek letters | `\alpha`, `\beta`, `\gamma`                                       | <img src="https://render.githubusercontent.com/render/math?math=\alpha, \beta, \gamma>                                          |
| steady state/fixed points     | `\bar x` or `\overline x`                                         | <img src="https://render.githubusercontent.com/render/math?math=\bar x, \overline x>                                          |
| vector forms                  | `\begin{bmatrix} x_{i, 1} \\ \vdots \\ x_{i, p+1}  \end{bmatrix}` | <img src="https://render.githubusercontent.com/render/math?math=\begin{bmatrix} x_{i, 1} \\ \vdots \\ x_{i, p+1} \end{bmatrix}> |

### Useful environment

#### `aligned` environment

A useful environment for aligning equations. Used inside a display mode math snippet.

```latex
$$
\begin{aligned}
y &= x^2 + 3x + 2 \\
  &= (x+1)(x+2)
\end{aligned}
$$
```

Effect:
<img src="https://render.githubusercontent.com/render/math?math=
\begin{aligned}
y &= x^2 + 3x + 2 \\
  &= (x+1)(x+2)
\end{aligned}
>

### Some special commands provided here

|                    | code                                                                 | effect                                                                                                                           |
| ------------------ | -------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| differentiate      | `\deriv{y}`, <br><br> `\deriv[t]{N}`, <br><br>`\derivlong{x^2+3x+2}` | $\frac{\mathrm{d}y}{\mathrm{d}x}$, <br><br>$\frac{\mathrm{d}N}{\mathrm{d}t}$, <br><br>$\frac{\mathrm{d}}{\mathrm{d}x}(x^2+3x+2)$ |
| partial derivative | `\pderiv{f}{x}`, <br><br>`\pderivlong{x^2+3x+2}{x}`                  | $\frac{\partial f}{\partial x}$, <br><br>$\frac{\partial}{\partial x}(x^2 + 3x + 2)$                                             |
|                    |
