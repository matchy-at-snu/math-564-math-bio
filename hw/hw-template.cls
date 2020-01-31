%hw-template.cls
\ProvidesClass{hw-template}
[2020/01/17 v1.0 General Purpose Homework Template]

\NeedsTeXFormat{LaTeX2e}

%
% TODO:
% [ ] put to TeXLive tempalte path (do some research)

% ---------------------------------------------------------------------------- %

% Load Parent Class
\LoadClass{article}

%
% LaTeX 3 project packages
%
% Better command/environment specification
\RequirePackage{xkeyval}
\RequirePackage{xparse}  % command/environment
\RequirePackage{xcolor}  % color

%
% Homework Details
%   - Title
%   - Due date
%   - Class
%   - Instructor
%   - Author
%

\def\hmwkTitle{Homework}
\def\hmwkDueDate{\today}
\def\hmwkClassNumber{ABCD1234.56}
\def\hmwkClassName{TEST}
\def\hmwkClassInstructor{Professor Unknown}
\def\hmwkAuthorName{Foo Bar}
\def\hmwkAuthorShort{Foo}

\define@key{hw-template.cls}{hw}[0]{
    \def\hmwkTitle{Homework \##1}
}

\define@key{hw-template.cls}{due}[\today]{
    \def\hmwkDueDate{#1}
}

\define@key{hw-template.cls}{classnum}[ABCD1234.56]{
    \def\hmwkClassNumber{#1}
}

\define@key{hw-template.cls}{classname}[TEST]{
    \def\hmwkClassName{#1}
}

\define@key{hw-template.cls}{teacher}[Unknown]{
    \def\hmwkClassInstructor{Professor #1}
}

\define@key{hw-template.cls}{author}[]{
    \def\hmwkAuthorName{#1}
}

\define@key{hw-template.cls}{authorshort}[]{
    \def\hmwkAuthorShort{#1}
}

\ExecuteOptionsX{hw, due, teacher}
\ProcessOptionsX

% For making headers
\RequirePackage{fancyhdr}
\RequirePackage{extramarks}

% For math
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}

% For drawing picture
\RequirePackage{tikz}

% For inserting svg
\RequirePackage{svg}

% For changing the enumerate style
\RequirePackage{enumitem}

% For better column formatting
\RequirePackage{multicol}

% For creating fancy tables
\RequirePackage{booktabs}

% For fancy code blocks with syntax highlighting
\RequirePackage[newfloat]{minted}

% -----------------------------------------------------------------------------%

%
% Configure Package Settings
%

% Set up code highlighting style
\usemintedstyle{xcode} % Light
% \usemintedstyle{native} <- Nice dark theme
% \usemintedstyle{monokai} <- Not bad dark theme

\RequirePackage{tcolorbox}
\RequirePackage{etoolbox}


% Background color designed for dart highlighting style
\definecolor{bg}{HTML}{282828}


\SetupFloatingEnvironment{listing}{name=Code Block} % Rename the label for listing
% Can set it to Code Block, if wanted to

\usetikzlibrary{automata,positioning}

\everymath{\displaystyle}

%
% Basic Document Settings
%
\topmargin=-0.45in
\evensidemargin=0in
\oddsidemargin=0in
\textwidth=6.5in
\textheight=9.0in
\headsep=0.25in

\linespread{1.1}

\pagestyle{fancy}

\IfNoValueTF{\hmwkAuthorShort}{
    \lhead{\hmwkAuthorName}
}{
    \lhead{\hmwkAuthorShort}
}
\chead{\hmwkClassNumber:\ (\hmwkClassInstructor): \hmwkTitle}
\rhead{\firstxmark}
\lfoot{\lastxmark}
\cfoot{\thepage}

\renewcommand\headrulewidth{0.4pt}
\renewcommand\footrulewidth{0.4pt}

\setlength\parindent{0pt}

%
% Create Problem Sections
%

\RequirePackage{xstring}

\newcommand*{\IsInteger}[3]{%
    \IfStrEq{#1}{ }{%
        #3% is a blank string
    }{%
        \IfInteger{#1}{#2}{#3}%
    }%
}%

\newcommand{\enterProblemHeader}[1]{
    \nobreak\extramarks{}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
}

\newcommand{\exitProblemHeader}[1]{
    \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    \stepcounter{#1}
    \nobreak\extramarks{Problem \arabic{#1}}{}\nobreak{}
}

\setcounter{secnumdepth}{0}
\newcounter{partCounter}
\newcounter{homeworkProblemCounter}
\setcounter{homeworkProblemCounter}{1}
\nobreak\extramarks{Problem \arabic{homeworkProblemCounter}}{}\nobreak{}

\ExplSyntaxOn
    \NewDocumentEnvironment{homeworkProblem} { oo }
    {
        \IsInteger{#1} {\setcounter{homeworkProblemCounter}{#1}}{}

        \IfNoValueTF{#2}{\section{Problem\ \arabic{homeworkProblemCounter}}}{
            \section{Problem\ \arabic{homeworkProblemCounter}:\ \textnormal{\textit{#2}}}
        }
        \setcounter{partCounter}{1}
        \IsInteger{#1} {\setcounter{homeworkProblemCounter}{#1}}{}
        \enterProblemHeader{homeworkProblemCounter}
    }
    {
        % \IfNoValueTF{#1} {}{\exitProblemHeader{#1}}
        \exitProblemHeader{homeworkProblemCounter}
    }
\ExplSyntaxOff

%
% Title Page
%

\title{
    \vspace{2in}
    \textmd{\textbf{\hmwkClassNumber:\ \hmwkClassName\\ \hmwkTitle}}\\
    \normalsize\vspace{0.1in}\small{Due\ on\ \hmwkDueDate}\\
    \vspace{0.1in}\large{\textit{\hmwkClassInstructor}}
    \vspace{3in}
}

\author{\textbf{\hmwkAuthorName}}
\date{\today}

%
% Formatting Commands
%

\renewcommand{\part}{\textbf{\large Part \Alph{partCounter}}\stepcounter{partCounter}}
\newcommand{\newpart}{\setcounter{partCounter}{1}}
% Alias for the Solution section header
\newcommand{\solution}{\textbf{\large Solution}}

\newcommand{\segline}{\rule{\linewidth}{0.1pt}}

%
% Various Helper Commands
%

% For derivatives
\newcommand{\derivlong}[1]{\frac{\mathrm{d}}{\mathrm{d}x} \left(#1\right)}
\newcommand{\deriv}[2][x]{\frac{\mathrm{d}#2}{\mathrm{d}#1}}

% For partial derivatives
\newcommand{\pderivlong}[2]{\frac{\partial}{\partial #2} \left(#1\right)}
\newcommand{\pderiv}[2]{\frac{\partial #1}{\partial #2}}

% For differentials
\newcommand{\dx}{\mathrm{d}x}
\newcommand{\dy}{\mathrm{d}y}

\AtBeginDocument{%
    \maketitle
    \pagebreak
}

\endinput