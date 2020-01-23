%hw-template.cls
\ProvidesClass{hw-template}
[2020/01/17 v1.0 General Purpose Homework Template]

\NeedsTeXFormat{LaTeX2e}

%
% TODO:
% [ ] algorithm / codeblock support
% [ ] put to TeXLive tempalte path (do some research)
% [ ] issue with comaptibility b/w MATH383 & MATH564 template

% ---------------------------------------------------------------------------- %

% Load Parent Class
\LoadClass{article}

\RequirePackage{xkeyval}

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

\ExecuteOptionsX{hw, due, teacher}
\ProcessOptionsX

% \regex_extract_once:nnN {(.*?):}{\hmwkClassFull} \hmwkClass

% For making headers
\RequirePackage{fancyhdr}
\RequirePackage{extramarks}

% For math
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}

% For drawing picture
\RequirePackage{tikz}

% For changing the enumerate style
\RequirePackage{enumitem}

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
\lhead{\hmwkAuthorName}
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
    \IsInteger{#1}{
        \nobreak\extramarks{}{Problem #1 continued on next page\ldots}\nobreak{}
        \nobreak\extramarks{Problem #1 (continued)}{Problem #1 continued on next page\ldots}\nobreak{}
    }{
        \nobreak\extramarks{}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
        \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
    }
}

\newcommand{\exitProblemHeader}[1]{
    \IsInteger{#1}{
        \nobreak\extramarks{Problem #1 (continued)}{Problem #1 continued on next page\ldots}\nobreak{}
        \nobreak\extramarks{Problem #1}{}\nobreak{}
    }{
        \nobreak\extramarks{Problem \arabic{#1} (continued)}{Problem \arabic{#1} continued on next page\ldots}\nobreak{}
        \stepcounter{#1}
        \nobreak\extramarks{Problem \arabic{#1}}{}\nobreak{}
    }
}

\setcounter{secnumdepth}{0}
\newcounter{partCounter}
\newcounter{homeworkProblemCounter}
\setcounter{homeworkProblemCounter}{1}
\nobreak\extramarks{Problem \arabic{homeworkProblemCounter}}{}\nobreak{}

\RequirePackage{xparse}
\ExplSyntaxOn
    \NewDocumentEnvironment{homeworkProblem} { o }
     {
        \IfNoValueTF{#1} {}{\setcounter{homeworkProblemCounter}{#1}}
        \section{Problem \arabic{homeworkProblemCounter}}
        \setcounter{partCounter}{1}
        \IfNoValueTF{#1} {}{\setcounter{homeworkProblemCounter}{#1}}
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