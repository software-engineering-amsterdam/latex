% Made by Dr. Vadim Zaytsev aka @grammarware
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uvamscse}[2014/03/25 UvA MSc SE document class v1.0]
\LoadClass[a4paper,10pt,oneside]{report}

\setlength{\textwidth}{440pt}
\setlength{\textheight}{660pt}
\setlength{\oddsidemargin}{10pt}
\setlength{\topmargin}{-10pt}
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}
\addtolength{\fboxsep}{1pt}

% \renewcommand{\chapter}[1]{\newpage{\large\bfseries \thechapter. #1}}
\newcommand{\chapterautorefname}{\S}
\newcommand{\sectionautorefname}{\S}
\newcommand{\subsectionautorefname}{\S}
\newcommand{\subsubsectionautorefname}{\S}

\usepackage{graphicx}
\usepackage{tocloft}
\usepackage{boxedminipage}
\usepackage{float}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amscd}
\usepackage[nottoc,notlot,notlof]{tocbibind}
\usepackage{multirow}
\usepackage[unicode,bookmarks=false,pdfstartview={FitW},colorlinks,linkcolor=blue,urlcolor=blue,citecolor=blue]{hyperref}
\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\doi}[1]{\texttt{\href{http://dx.doi.org/#1}{doi:#1}}}

\newcommand{\uvahost}{Universiteit van Amsterdam}
\newcommand{\host}[1]{\renewcommand{\uvahost}{#1}}

\newcommand{\uvatitle}{Cool Story Bro. Name It with \texttt{$\backslash$title} and \texttt{$\backslash$subtitle}}
\renewcommand{\title}[1]{\renewcommand{\uvatitle}{#1}\hypersetup{pdftitle={#1}}}
\newcommand{\uvasubtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\uvasubtitle}{{\LARGE\bfseries #1\par}}}

\newcommand{\uvaauthor}{Y U NO USE \texttt{$\backslash$author}?}
\renewcommand{\author}[1]{\renewcommand{\uvaauthor}{#1}\setcounter{page}{0}\hypersetup{pdfauthor={#1}}}
% \newcommand{\autref}[1]{\if\thepage0\else\hyperlink{aut#1}{$^#1$}\fi}
% \newcommand{\sponsor}[1]{\if\thepage0\else\footnote{#1}\fi}

\newcommand{\uvadate}{\today}
\renewcommand{\date}[1]{\renewcommand{\uvadate}{#1}}
\newcommand{\uvaemail}{}
\newcommand{\authemail}[1]{\renewcommand{\uvaemail}{{\ttfamily\email{#1}}\par}}
\newcommand{\uvasuper}{One does not simply do a thesis without \texttt{$\backslash$supervisor}!}
\newcommand{\supervisor}[1]{\renewcommand{\uvasuper}{#1}}

\newcommand{\uvapic}{}
\newcommand{\coverpic}[2][.9\textwidth]{\renewcommand{\uvapic}{\centerline{\includegraphics[width=#1]{#2}}}}

\newcommand{\uvaabstract}{}
\renewcommand{\abstract}[2][Abstract]{\renewcommand{\uvaabstract}{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}%
\par#2\newpage}}

%% Listing environment
\newcommand{\listofsourcecodename}{List of Listings}
\newlistof{sourcecode}{lol}{\listofsourcecodename}
\floatstyle{boxed}
\newfloat{sourcecode}{thp}{lol}[chapter]
\floatname{sourcecode}{Listing}
\renewcommand{\theHsourcecode}{src:\arabic{sourcecode}}
\newcommand{\sourcecodeautorefname}{Listing}
\renewcommand{\thesourcecode}{\thechapter.\arabic{sourcecode}}
%% end of Listing environment

%% Listing environment
\newenvironment{snippet}{\vspace{2pt}\noindent\begin{boxedminipage}{\textwidth}\footnotesize\ttfamily}{\end{boxedminipage}\vspace{2pt}}

\newenvironment{graybox}{%
   \begin{lrbox}{\@tempboxa}\begin{minipage}{0.92\columnwidth}\footnotesize}{\end{minipage}\end{lrbox}%
   \colorbox[gray]{0.92}{\usebox{\@tempboxa}}
}
%% end of Listing environment


\newcommand{\uvacoverfoot}{%
  \vfill
  \begin{center}
  \begin{tabular}{r|l}
    \multirow{3}{*}{\includegraphics[height=48pt]{uva.pdf}}
    &\textsc{\Large Universiteit vam Amsterdam}\\
	&\textsc{Faculteit der Natuurwetenschappen, Wiskunde en Informatica}\\
	&\textsc{Master Software Engineering}\\
	&\url{http://software-engineering-amsterdam.nl}
		% Supervisor: Prof Dr P. Klint
  \end{tabular}
  \end{center}
  }

\renewcommand{\maketitle}{%
  % The cover page
  % --------------
  \thispagestyle{empty}
  \enlargethispage{30pt}
  \renewcommand{\thefootnote}{\fnsymbol{footnote}}
  % Will be page 0, s.t. contents start on page 1
  \setcounter{page}{0}
  % \eccoverhead
  % Volume and article title, author(s)
  \vspace{60pt}
  \begin{center}
    {\Huge\bfseries\uvatitle\par}
    \uvasubtitle
    \vspace{22pt}
    \uvapic
    \vspace{22pt}
    {\Large\bfseries\uvaauthor\par}
    \uvaemail
    \vspace{11pt}
    \uvadate, \pageref*{lastpage} pages
  \end{center}
  \vfill
  \begin{tabular}{ll}
  	\textbf{Supervisor:} 		& \uvasuper\\
  	\textbf{Host organisation:} & \uvahost
  \end{tabular}
  \uvacoverfoot
  \newpage
  \tableofcontents
  \newpage
  \uvaabstract
  \global\@topnum\z@ % To prevent floats above the title
  \setcounter{footnote}{0}
  \renewcommand{\thefootnote}{\arabic{footnote}}
  \setlength{\parskip}{0pt}
  }
\AtEndDocument{%
  \clearpage%
  \addtocounter{page}{-1}%
  \immediate\write\@auxout{\string
  \newlabel{lastpage}{{}{\thepage}{}{}}}%
  \addtocounter{page}{1}}