# math-bio

Homework repository for [MATH564 MATH MODELING](https://www.coursicle.com/unc/courses/MATH/564/) @ [UNC-Chapel Hill](https://www.unc.edu/)

## File structure

```PowerShell
math-bio
│  .gitignore
│  hw-template.cls -----------------template
│  new_probs.ps1 -------------------powershell script, auto-create hw folder
│  README.md
│
├─hw1 ------------------------------homework directories
│  │  hw1.pdf ----------------------compiled pdf
│  │  hw1.tex ----------------------.tex source file
│  │  hw1_plot.py ------------------python script for plotting
│  ├─sections ----------------------subfiles corresponding to hw problems
│  │      prob1.tex
│  │      prob2.tex
│  │      ...
│  └─fig ---------------------------graphs plotted by hw[0-9]_plot.py
│         fig2(a).pdf
│         ...
├─hw2
└─...
```

The multiple `.tex` files are compiled into 1 using package `subfile`.
Within each `hw[0-9]` directory, there will be a `fig` folder storing all the figures,
a `sections` folder containing all the subfiles

## Brief LaTeX reference

### Two modes in latex that can typeset the formulations

1. **Inline mode**, start with an `$`, end with an `$` (`$...$`). 
2. **Display mode**, start with two `$$`, end with two `$$` (`$$...$$`)

 `\(...\)` and `\[...\]` can also start inline mode math and display mode math, respectively. We recommend using `$...$` for inline mode delimiter and `\[...\]` for displaymode delimiter, for clearer distinction.

### Basic Maths

1. It is straight-forward for basic arithmetic operations. E.g. `+`, `-` `*` `/`, `a^b`, `a_b` will give ![+, - * /, a^b, a_b](https://render.githubusercontent.com/render/math?math=%2B%2C%20-%20*%20%2F%2C%20a%5Eb%2C%20a_b)
2. ![\LaTeX](https://render.githubusercontent.com/render/math?math=%5CLaTeX) already defined many useful symbols, macros, (or functions) to typeset the formulations. They start with `\`, such as `\LaTeX` is for the latex symbol. In some typeset functions you can give them parameters. E.g. `\frac{1}{3}` typesets one over three, where the thing within the first `{}` is nominator, and the thing within the second `{}` is denominator. {} also helps group thing within it together. Consider the difference between `a_b+1` (![a_b+1](https://render.githubusercontent.com/render/math?math=a_b%2B1)) and `a_{b+1}` (![a_{b+1}](https://render.githubusercontent.com/render/math?math=a_%7Bb%2B1%7D))

### Useful symbols and functions

|                               | code                                                              | effect                                                                                                                                                                                                                                      |
| ----------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| fraction                      | `\frac{1}{3}`                                                     | ![\frac{1}{3}](https://render.githubusercontent.com/render/math?math=%5Cfrac%7B1%7D%7B3%7D)                                                                                                                                                 |
| summation                     | `\sum_{i=1}^{N}`                                                  | ![\sum_{i=1}^{N}](https://render.githubusercontent.com/render/math?math=%5Csum_%7Bi%3D1%7D%5E%7BN%7D)                                                                                                                                       |
| products                      | `\prod_{i=1}^{N}`                                                 | ![\prod_{i=1}^{N}](https://render.githubusercontent.com/render/math?math=%5Cprod_%7Bi%3D1%7D%5E%7BN%7D)                                                                                                                                     |
| indexing                      | `w_{i, j}`                                                        | ![w_{i, j}](https://render.githubusercontent.com/render/math?math=w_%7Bi%2C%20j%7D)                                                                                                                                                         |
| frequently used Greek letters | `\alpha`, `\beta`, `\gamma`                                       | ![\alpha, \beta, \gamma](https://render.githubusercontent.com/render/math?math=%5Calpha%2C%20%5Cbeta%2C%20%5Cgamma)                                                                                                                         |
| steady state/fixed points     | `\bar x` or `\overline x`                                         | ![\bar x, \overline x](https://render.githubusercontent.com/render/math?math=%5Cbar%20x%2C%20%5Coverline%20x)                                                                                                                               |
| vector forms                  | `\begin{bmatrix} x_{i, 1} \\ \vdots \\ x_{i, p+1}  \end{bmatrix}` | ![\begin{bmatrix} x_{i, 1} \\ \vdots \\ x_{i, p+1} \end{bmatrix}](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bbmatrix%7D%20x_%7Bi%2C%201%7D%20%5C%5C%20%5Cvdots%20%5C%5C%20x_%7Bi%2C%20p%2B1%7D%20%5Cend%7Bbmatrix%7D) |

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
<div style="text-align:center">
<img alt="\begin{aligned} y &= x^2 + 3x + 2 \\   &= (x+1)(x+2) \end{aligned}" src="https://render.githubusercontent.com/render/math?math=%5Cbegin%7Baligned%7D%20y%20%26%3D%20x%5E2%20%2B%203x%20%2B%202%20%5C%5C%20%20%20%26%3D%20(x%2B1)(x%2B2)%20%5Cend%7Baligned%7D%20">
</div>

### Some special commands provided here

|                    | code                                                         | effect                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| derivative      | `\deriv{y}`, <br> `\deriv[t]{N}`, <br>`\derivlong{x^2+3x+2}` | ![\frac{\mathrm{d}y}{\mathrm{d}x}](https://render.githubusercontent.com/render/math?math=%5Cfrac%7B%5Cmathrm%7Bd%7Dy%7D%7B%5Cmathrm%7Bd%7Dx%7D),<br>![\frac{\mathrm{d}N}{\mathrm{d}t}](https://render.githubusercontent.com/render/math?math=%5Cfrac%7B%5Cmathrm%7Bd%7DN%7D%7B%5Cmathrm%7Bd%7Dt%7D),<br>![\frac{\mathrm{d}}{\mathrm{d}x}(x^2+3x+2)](https://render.githubusercontent.com/render/math?math=%5Cfrac%7B%5Cmathrm%7Bd%7D%7D%7B%5Cmathrm%7Bd%7Dx%7D(x%5E2%2B3x%2B2)) |
| partial derivative | `\pderiv{f}{x}`, <br><br>`\pderivlong{x^2+3x+2}{x}`          | ![\frac{\partial f}{\partial x}](https://render.githubusercontent.com/render/math?math=%5Cfrac%7B%5Cpartial%20f%7D%7B%5Cpartial%20x%7D), <br>![\frac{\partial}{\partial x}(x^2 + 3x + 2)](https://render.githubusercontent.com/render/math?math=%5Cfrac%7B%5Cpartial%7D%7B%5Cpartial%20x%7D(x%5E2%20%2B%203x%20%2B%202))                                                                                                                                                        |
