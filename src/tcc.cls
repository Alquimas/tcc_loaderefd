\LoadClass[12pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[portuguese,brazil]{babel}
\RequirePackage{titlesec}
\RequirePackage{titling}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage{float}
\RequirePackage{setspace} 
\RequirePackage{afterpage}
\RequirePackage{tabularx}
\RequirePackage{fancyhdr}
\RequirePackage[labelfont=bf,textfont=bf]{caption}
\RequirePackage{booktabs}

\usepackage{newtxtext,newtxmath}


%\pagestyle{fancy}
%\rfoot{\thepage}

% Define paginas em branco
\newcommand\blankpage{%
    \null
    \thispagestyle{empty}%
    \addtocounter{page}{-1}%
    \newpage}

% Define as margens
\RequirePackage[a4paper, left = 3cm, right = 2cm, top = 3cm, bottom = 2cm]{geometry}

\newcommand{\MONTH}{%
  \ifcase\the\month
  \or Janeiro % 1
  \or Fevereiro % 2
  \or Mar\c{c}o % 3
  \or Abril % 4
  \or Maio % 5
  \or Junho % 6
  \or Julho % 7
  \or Agosto % 8
  \or Setembro % 9
  \or Outubro % 10
  \or Novembro % 11
  \or Dezembro % 12
  \fi}

%Formata parágrafo%
\parindent=0.49in
\parskip=0pt
\onehalfspacing

%Configura sections e variantes%
\renewcommand\section{\@startsection{section}{1}{\z@}%
                       {-18\p@ \@plus -4\p@ \@minus -4\p@}%
                       {12\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\newpage\normalfont\large\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                       {-18\p@ \@plus -4\p@ \@minus -4\p@}%
                       {8\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\normalsize\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}
\makeatletter
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                       {-18\p@ \@plus -4\p@ \@minus -4\p@}%
                       {8\p@ \@plus 4\p@ \@minus 4\p@}%
                       {\normalfont\normalsize\bfseries\boldmath
                        \rightskip=\z@ \@plus 8em\pretolerance=10000 }}
\makeatother
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                       {-12\p@ \@plus -4\p@ \@minus -4\p@}%
                       {-0.5em \@plus -0.22em \@minus -0.1em}%
                       {\normalfont\normalsize\itshape}}

% --- CONFIGURAÇÕES DE ESPAÇAMENTO PARA IMAGENS E TABELAS (ABNT) ---

% 1. Configura a distância entre o Título e a Imagem, e entre a Imagem e a Fonte
\captionsetup{
    skip=6pt,          % Distância mínima (aprox. 2mm) entre título/fonte e a imagem
    font=small,        % Garante fonte tamanho 10
    singlelinecheck=true,   
    justification=centering
}

% 2. Configura a "linha em branco" (respiro) entre o texto e o bloco da imagem
\setlength{\intextsep}{18pt}  % Espaço extra quando a imagem está no meio do texto
\setlength{\textfloatsep}{18pt} % Espaço quando a imagem vai para o topo ou base da página

%Referencias %
\usepackage{xurl} 
\usepackage[breaklinks=true, hidelinks]{hyperref}

\makeatletter
\renewcommand{\@biblabel}[1]{}
\makeatother

\usepackage{fancyhdr}

% 1. Ativa o estilo principal
\pagestyle{fancy}
\fancyhf{} % Limpa tudo
\rhead{\thepage} % Coloca o número no canto superior direito
\renewcommand{\headrulewidth}{0pt} % Tira a linha do cabeçalho

% 2. Força as páginas de novos capítulos a obedecerem a mesma regra
\fancypagestyle{plain}{
  \fancyhf{}
  \rhead{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\usepackage[T1]{fontenc}

\usepackage[dvipsnames]{xcolor}
\usepackage{xcolor}
\usepackage{listings}
    \definecolor{codegreen}{rgb}{0,0.6,0}
    \definecolor{codegray}{rgb}{0.5,0.5,0.5}
    \definecolor{codepurple}{rgb}{0.27,0.06,1.91}
    \definecolor{backcolour}{rgb}{0.95,0.95,0.92}
    \definecolor{2backcolour}{rgb}{1, 1, 1}

    \lstdefinestyle{mystyle}{
        backgroundcolor=\color{backcolour},   
        commentstyle=\color{codegreen},
        keywordstyle=\color{green},
        numberstyle=\tiny\color{codegray},
        stringstyle=\color{codepurple},
        basicstyle=\ttfamily\footnotesize,
        breakatwhitespace=false,         
        breaklines=true,                 
        captionpos=t,
        belowcaptionskip=8pt,
        keepspaces=true,                 
        %numbers=left,                    
        numbersep=5pt,                  
        showspaces=false,                
        showstringspaces=false,
        showtabs=false,                  
        tabsize=2,
        inputencoding = utf8,  % Input encoding
        extendedchars = true,  % Extended ASCII
        literate      =        % Support additional characters
            {ENTÃO}{{\textcolor{red}{\textbf{\ttfamily ENT\~AO}}}}5
            {Cenário:}{{\textcolor{blue}{\textbf{\ttfamily Cen\'ario:}}}}8
            {á}{{\'a}}1  {é}{{\'e}}1  {í}{{\'i}}1 {ó}{{\'o}}1  {ú}{{\'u}}1
            {Á}{{\'A}}1  {É}{{\'E}}1  {Í}{{\'I}}1 {Ó}{{\'O}}1  {Ú}{{\'U}}1
            {à}{{\`a}}1  {è}{{\`e}}1  {ì}{{\`i}}1 {ò}{{\`o}}1  {ù}{{\`u}}1
            {À}{{\`A}}1  {È}{{\`E}}1  {Ì}{{\`I}}1 {Ò}{{\`O}}1  {Ù}{{\`U}}1
            {ä}{{\"a}}1  {ë}{{\"e}}1  {ï}{{\"i}}1 {ö}{{\"o}}1  {ü}{{\"u}}1
            {Ä}{{\"A}}1  {Ë}{{\"E}}1  {Ï}{{\"I}}1 {Ö}{{\"O}}1  {Ü}{{\"U}}1
            {â}{{\^a}}1  {ê}{{\^e}}1  {î}{{\^i}}1 {ô}{{\^o}}1  {û}{{\^u}}1
            {Â}{{\^A}}1  {Ê}{{\^E}}1  {Î}{{\^I}}1 {Ô}{{\^O}}1  {Û}{{\^U}}1
            {œ}{{\oe}}1  {Œ}{{\OE}}1  {æ}{{\ae}}1 {Æ}{{\AE}}1  {ß}{{\ss}}1
            {ẞ}{{\SS}}1  {ç}{{\c{c}}}1 {Ç}{{\c{C}}}1 {ø}{{\o}}1  {Ø}{{\O}}1
            {å}{{\aa}}1  {Å}{{\AA}}1  {ã}{{\~a}}1  {õ}{{\~o}}1 {Ã}{{\~A}}1
            {Õ}{{\~O}}1  {ñ}{{\~n}}1  {Ñ}{{\~N}}1  {¿}{{?`}}1  {¡}{{!`}}1
            {°}{{\textdegree}}1 {º}{{\textordmasculine}}1 {ª}{{\textordfeminine}}1
            {£}{{\pounds}}1  {©}{{\copyright}}1  {®}{{\textregistered}}1
            {«}{{\guillemotleft}}1  {»}{{\guillemotright}}1  {Ð}{{\DH}}1  {ð}{{\dh}}1
            {Ý}{{\'Y}}1    {ý}{{\'y}}1    {Þ}{{\TH}}1    {þ}{{\th}}1    {Ă}{{\u{A}}}1
            {ă}{{\u{a}}}1  {Ą}{{\k{A}}}1  {ą}{{\k{a}}}1  {Ć}{{\'C}}1    {ć}{{\'c}}1
            {Č}{{\v{C}}}1  {č}{{\v{c}}}1  {Ď}{{\v{D}}}1  {ď}{{\v{d}}}1  {Đ}{{\DJ}}1
            {đ}{{\dj}}1    {Ė}{{\.{E}}}1  {ė}{{\.{e}}}1  {Ę}{{\k{E}}}1  {ę}{{\k{e}}}1
            {Ě}{{\v{E}}}1  {ě}{{\v{e}}}1  {Ğ}{{\u{G}}}1  {ğ}{{\u{g}}}1  {Ĩ}{{\~I}}1
            {ĩ}{{\~\i}}1   {Į}{{\k{I}}}1  {į}{{\k{i}}}1  {İ}{{\.{I}}}1  {ı}{{\i}}1
            {Ĺ}{{\'L}}1    {ĺ}{{\'l}}1    {Ľ}{{\v{L}}}1  {ľ}{{\v{l}}}1  {Ł}{{\L{}}}1
            {ł}{{\l{}}}1   {Ń}{{\'N}}1    {ń}{{\'n}}1    {Ň}{{\v{N}}}1  {ň}{{\v{n}}}1
            {Ő}{{\H{O}}}1  {ő}{{\H{o}}}1  {Ŕ}{{\'{R}}}1  {ŕ}{{\'{r}}}1  {Ř}{{\v{R}}}1
            {ř}{{\v{r}}}1  {Ś}{{\'S}}1    {ś}{{\'s}}1    {Ş}{{\c{S}}}1  {ş}{{\c{s}}}1
            {Š}{{\v{S}}}1  {š}{{\v{s}}}1  {Ť}{{\v{T}}}1  {ť}{{\v{t}}}1  {Ũ}{{\~U}}1
            {ũ}{{\~u}}1    {Ū}{{\={U}}}1  {ū}{{\={u}}}1  {Ů}{{\r{U}}}1  {ů}{{\r{u}}}1
            {Ű}{{\H{U}}}1  {ű}{{\H{u}}}1  {Ų}{{\k{U}}}1  {ų}{{\k{u}}}1  {Ź}{{\'Z}}1
            {ź}{{\'z}}1    {Ż}{{\.Z}}1    {ż}{{\.z}}1    {Ž}{{\v{Z}}}1
    }
    \lstset{style=mystyle}
\setlength{\parskip}{1em} 

\lstdefinelanguage{gherkin}{
    keywords={DADO, E, QUANDO},
    sensitive=true,
    keywordstyle=\color{red}\bfseries
}
\newcommand{\fonte}[1]{%
  \vspace{-1.0em} % Ajusta o espaçamento vertical entre o quadro e a fonte
  {\centering{\small Fonte: #1\par}}
}

% 1. Define o novo ambiente 'quadro'
\floatstyle{plaintop}
\newfloat{quadro}{htbp}{loq}
\floatname{quadro}{Quadro}  

% 2. Cria o comando base
\newcommand{\listofquadros}{\listof{quadro}{LISTA DE QUADROS}} 

\makeatletter
% 3. Reescreve a lista para forçar o título centralizado sem bugar
\renewcommand{\listofquadros}{%
    \section*{\centering LISTA DE QUADROS} 
    \@starttoc{loq}%
}

% 4. Como o comando não existia, usamos \newcommand (Criar) em vez de \renewcommand
\newcommand{\l@quadro}[2]{\vspace{0pt}\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}
\makeatother

\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\usepgfplotslibrary{statistics}

\renewcommand{\labelitemi}{---}

\usepackage{array}
\usepackage{pgf-pie}
\usepackage{pdfpages}