% Class: purana
% Version: 0.01-2022/11/15
% License: LPPL 1.3c
% GitHub Repo: https://github.com/elvenbrill/texmf/
%
% This Work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, in its
% version 1.3c. This version of this license is in
% http://www.latex-project.org/lppl/lppl-1-3c.txt
% and the latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of
% LaTeX version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{purana}[2022/11/15 v0.1 Standard book class adapted
                      for typsetting documents in IAST/Devanāgarī]

% Pre-defined options
% Font size
\newcommand\purana@fontsize{12pt} % Set default fontsize to 12pt
\DeclareOption{10pt}{\renewcommand\purana@fontsize{10pt}}%
\DeclareOption{11pt}{\renewcommand\purana@fontsize{11pt}}%
\DeclareOption{12pt}{\renewcommand\purana@fontsize{12pt}}%
\PassOptionsToClass{\purana@fontsize}{book}%

% Page size
\newcommand\purana@papersize{a4paper} % Set default as a4paper
\DeclareOption{a4paper}{\renewcommand\purana@papersize{a4paper}}%
\DeclareOption{a5paper}{\renewcommand\purana@papersize{a5paper}}%
\PassOptionsToClass{\purana@papersize}{book}%

% Column layout
\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}\@onesidetrue}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% Generates warning for unknown options
\DeclareOption*{
\ClassWarning{purana}{Unknown or non-standard option '\CurrentOption'.
I'll see if I can load it from the book class. If you get a warning
unused global option(s): `\CurrentOption` then the option is not
supported!}
\PassOptionsToClass{\CurrentOption}{book}%
}

% Process options and load class
\ProcessOptions\relax%
\LoadClass{book}%

% Packages
\RequirePackage{ifthen}      % Conditional statements
\RequirePackage{iftex}       % Check for LaTeX, XeLaTeX, etc.
\RequirePackage{calc}        % Calculate vertical spacing
\RequirePackage{keyval}      % Key/Value statements
\RequirePackage{etoolbox}    % A toolbox of programming facilities
\RequirePackage{varwidth}    % A variable-width minipage
\RequirePackage{xspace}      % Adds a space at the end of a textmacro
\RequirePackage{textcase}    % Case conversion ignoring mathematics, etc.
\RequirePackage{setspace}    % Set space between lines
\RequirePackage{xfrac}       % Nice fractions
\RequirePackage{hologo}      % Better TeX/LaTex/XeLaTeX logos
\RequirePackage{fontspec}    % Use OpenType fonts with XeLaTeX
\RequirePackage{polyglossia} % Multilingual support

% Metadata
\DeclareDocumentCommand{\date}{m}{\newcommand{\udate}{#1}\renewcommand{\@date}{#1}}
\DeclareDocumentCommand{\title}{m}{\newcommand{\utitle}{#1}\renewcommand{\@title}{#1}}
\DeclareDocumentCommand{\author}{m}{\newcommand{\uauthor}{#1}\renewcommand{\@author}{#1}}
\DeclareDocumentCommand{\isbn}{m}{\newcommand{\uisbn}{#1}}
\DeclareDocumentCommand{\publisher}{m}{\newcommand{\upublisher}{#1}}
\DeclareDocumentCommand{\edition}{m}{\newcommand{\uedition}{#1}}
\DeclareDocumentCommand{\volume}{m}{\newcommand{\uvolume}{#1}}
\DeclareDocumentCommand{\revision}{m}{\newcommand{\urevision}{#1}}

% Colors
\RequirePackage{xcolor}
  \definecolor{lightgray}{RGB}{211,211,211}
  \definecolor{darkgray}{RGB}{64,64,79}
  \definecolor{gold}{RGB}{255,204,0}
  \definecolor{orange}{RGB}{255,103,0}
  \definecolor{red}{RGB}{255,0,0}
  \definecolor{pink}{RGB}{255,182,193}
  \definecolor{crimson}{RGB}{211,0,63}
  \definecolor{trueblue}{RGB}{0,47,167}
  \definecolor{teal}{RGB}{0,128,128}
  \definecolor{truegreen}{RGB}{0,102,0}

% Standard page layout
\RequirePackage{geometry}
  \geometry{includehead, includefoot, footskip=8mm}
  \geometry{nomarginpar}

% Clear header style on the last empty odd pages
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty} % Empty header styles
	\newpage%
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}

% Paragraph identation
\RequirePackage[parfill]{parskip}
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{6pt plus 2pt minus 4pt}
  \setlength{\emergencystretch}{3em}
  \frenchspacing

% Misc layout settings
\lefthyphenmin=3
\righthyphenmin=3
\clubpenalty=10000
\widowpenalty=10000
