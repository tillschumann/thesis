%
% VRThesis.cls  
%
% Thesis template for thesis written for the VR Group, 
% RWTH Aachen University
%
% Copyright 2005, VR Group, RWTH Aachen University

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VRThesis}[2006/01/27 RWTH Aachen University]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% declare and process options 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@litnum     \@litnumfalse
\newif\if@indexnum   \@indexnumfalse
\newif\if@VRThesisgerman

\DeclareOption{litnum}{\@litnumtrue}
\DeclareOption{indexnum}{\@indexnumnumtrue}
\DeclareOption{german}{%
    \@VRThesisgermantrue
}
\DeclareOption{sserif}{%
		\renewcommand{\familydefault}{\sfdefault}
}
% pass unknown options to class 'scrbook' 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}

% process options
% clsguide: ".. because \ProcessOptions has a *-form, it is wise to
%            follow the non-star form with \relax [...] since this 
%            prevents unncessary look ahead and possibly misleading 
%            error messages being issued."
\ProcessOptions\relax

\PassOptionsToClass{fleqn,12pt,a4paper,titlepage}{scrbook}
\LoadClass{scrbook}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load required packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[fleqn]{amsmath}     % math-symbols
\RequirePackage{amssymb} 				    % math-symbols
\RequirePackage{ifthen}             % enable if .. then .. else structures in
                                    % class-file
\RequirePackage{calc}               % enable primitive calculations in class
\RequirePackage[scaled=.92]{helvet}
\RequirePackage{courier}
\RequirePackage{array}              % better table support
\RequirePackage[dvips]{graphicx}    % support eps-files
\RequirePackage{fancyhdr}           % support nice page-headers
\RequirePackage{hangcaption}
%\RequirePackage[ps2pdf]{hyperref}
\RequirePackage{makeidx}            % support index
%\RequirePackage[small,hang]{caption} % modifie default caption layout
\RequirePackage{caption}[2003/12/20] %enforce most current version of caption
\DeclareCaptionOption{parskip}[]{}
\RequirePackage{varwidth}
\RequirePackage{color}
\RequirePackage{psfrag}
\RequirePackage{amsthm}            % math-theorems

%\RequirePackage{verbatim}
%\RequirePackage{listings}
%\RequirePackage{footnote}
%\RequirePackage{picins}

%GERMAN ONLY PACAKGES
\if@VRThesisgerman
\RequirePackage[ngerman]{babel}     % german strings for chapter, contents, 
                                    % ... and german hyphenation rules
\RequirePackage{bibgerm}			% make german bibtex styles available
\RequirePackage[T1]{fontenc}        % use T1 fontencoding
\RequirePackage[latin1]{inputenc}   % allow to type umlaute directly instead of
                                    % \"a or similar
\RequirePackage[german]{fancyref}
\else
\RequirePackage{fancyref}
\fi


\newcommand{\@RWTHde}{Rheinisch-Westf{\"a}lische Technische Hochschule Aachen}
\newcommand{\@RWTHen}{RWTH Aachen University}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% cover title
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% title for bachelor thesis
\if@titlepage
\newcommand{\makecoverBachelor} {
\begin{titlepage}
    \begin{center}
    \null\vfill
    \selectfont\Large \if@VRThesisgerman{\@RWTHde}\else{\@RWTHen}\fi \\
    \vspace*{30mm}
    \if@VRThesisgerman{Bachelor These}\else{Bachelor Thesis} \fi
    \\
    \vspace{1.5em} 
    \sffamily\bfseries\selectfont\Large {\@title} \\ %Title
    \vspace{2.5em} 
    \normalfont\selectfont\large
    \vspace{1.5em}
    \if@VRThesisgerman{von}\else{by}\fi \\
    \vspace{1.5em}
    {\@author} \\ % Name of the student
    \vspace*{30mm}
    \end{center}
    \vspace{17.5em}
    \clearpage
    \thispagestyle{empty} 
    \clearpage
    \setcounter{page}{0}
\end{titlepage}
    \setcounter{footnote}{0}%
}
\else % if titlepage
\newcommand{\makecoverBachelor}{
    \setcounter{footnote}{0}%
}
\fi

% title for Diplomarbeit (deutsch) and master thesis (english)
\if@titlepage
\newcommand{\makecoverMaster} {
\begin{titlepage}
    \begin{center}
    \null\vfill
    \selectfont\Large \if@VRThesisgerman{\@RWTHde}\else{\@RWTHen}\fi \\
    \vspace*{30mm}
    \if@VRThesisgerman{Diplomarbeit}\else{Master Thesis} \fi
    \\
    \vspace{1.5em} 
    \sffamily\bfseries\selectfont\Large {\@title} \\ %Title
    \vspace{2.5em} 
    \normalfont\selectfont\large
    \vspace{1.5em}
    \if@VRThesisgerman{von}\else{by}\fi \\
    \vspace{1.5em}
    {\@author} \\ % Name of the student
    \vspace*{30mm}
    \end{center}
    \vspace{17.5em}
    \clearpage
    \thispagestyle{empty} 
    \clearpage
    \setcounter{page}{0}
\end{titlepage}
    \setcounter{footnote}{0}%
}
\else % if titlepage
\newcommand{\makecoverMaster}{
    \setcounter{footnote}{0}%
}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% standardized title pages for PhD and diploma
%% thesis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@studentid}{}
\newcommand{\studentid}[1]{\gdef\@studentid{#1}}
\newcommand{\@fieldofstudy}{}
\newcommand{\fieldofstudy}[1]{\gdef\@fieldofstudy{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@secondsupervisor}{}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\@tutor}{}
\newcommand{\tutor}[1]{\gdef\@tutor{#1}}
\newcommand{\@extutor}{}
\newcommand{\extutor}[1]{\gdef\@extutor{#1}}

% options for a PhD thesis
\newcommand{\@academictitle}{}
\newcommand{\academictitle}[1]{\gdef\@academictitle{#1}}
\newcommand{\@bornin}{}
\newcommand{\bornin}[1]{\gdef\@bornin{#1}}
\newcommand{\@onlinesentence}{Diese Dissertation ist auf den Internetseiten der Hochschulbibliothek online verf?gbar.}
\newcommand{\onlinesentence}[1]{\gdef\@onlinesentence{#1}}

% title for bachelor thesis
\if@titlepage
\newcommand{\maketitleBachelor} {
\begin{titlepage}
	\begin{center}
	\null\vfill
	\selectfont\Large \if@VRThesisgerman{\@RWTHde}\else{\@RWTHen}\fi \\
	\vspace*{30mm}
	\if@VRThesisgerman{Bachelor These}\else{Bachelor Thesis} \fi
	\\
	\vspace{1.5em} 
	\sffamily\bfseries\selectfont\Large {\@title} \\ %Title
	\vspace{1.5em} 
	\normalfont\selectfont\large
	\if@VRThesisgerman{im Studiengang }\else{for the degree of B.Sc. in }\fi {\@fieldofstudy} \\ % z.B. Informatik
	\vspace{1.5em}
	\if@VRThesisgerman{von}\else{by}\fi \\
	\vspace{1.5em}
	{\@author} \\ % Name of the student
	\if@VRThesisgerman{Mat.-Nr.: }\else{Student Id.: }\fi {\@studentid} \\ % Matrikelnummer
	\vspace*{20mm}
	{\@firstsupervisor} \\ % first Prof.
	\vspace{1.5em} 
	{\@secondsupervisor} \\ % second Prof.
	\vspace{1.5em} 
	\begin{minipage}[b]{90mm}
	\begin{center}
	\begin{tabular}{ll}
	\if@VRThesisgerman{Betreuer: }\else{Supervisor: }\fi & {\@tutor}
	\end{tabular}
	\end{center}
	\end{minipage} \\
	\begin{minipage}[b]{90mm}
	\begin{center}
	\begin{tabular}{ll}
	\if@VRThesisgerman{Externer Betreuer: }\else{External supervisor: }\fi & {\@extutor}
	\end{tabular}
	\end{center}
	\end{minipage} \\
	\vspace{1.5em}
	\if@VRThesisgerman{Eingereicht am: }\else{Date of issue: }\fi {\@date} \\ % issue date
	\end{center}
	\clearpage
	\thispagestyle{empty} 
	\clearpage
	\setcounter{page}{0}
	\normalfont
\end{titlepage}
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@extutor\@empty
    \global\let\extutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\else % if titlepage
\newcommand{\maketitleBachelor}{
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@extutor\@empty
    \global\let\extutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\fi

% title for Diplomarbeit (deutsch) and master thesis (english)
\if@titlepage
\newcommand{\maketitleMaster} {
\begin{titlepage}
	\begin{center}
	\null\vfill
	\selectfont\Large \if@VRThesisgerman{\@RWTHde}\else{\@RWTHen}\fi \\
	\vspace*{30mm}
	\if@VRThesisgerman{Diplomarbeit}\else{Master Thesis} \fi
	\\
	\vspace{1.5em} 
	\sffamily\bfseries\selectfont\Large {\@title} \\ %Title
	\vspace{1.5em} 
	\normalfont\selectfont\large
	\if@VRThesisgerman{im Studiengang }\else{for the degree of M.Sc. in }\fi {\@fieldofstudy} \\ % z.B. Informatik
	\vspace{1.5em}
	\if@VRThesisgerman{von}\else{by}\fi \\
	\vspace{1.5em}
	{\@author} \\ % Name of the student
	\if@VRThesisgerman{Mat.-Nr.: }\else{Student Id.: }\fi {\@studentid} \\ % Matrikelnummer
	\vspace*{20mm}
	{\@firstsupervisor} \\ % first Prof.
	\vspace{1.5em} 
	{\@secondsupervisor} \\ % second Prof.
	\vspace{1.5em} 
	\begin{minipage}[b]{90mm}
	\begin{center}
	\begin{tabular}{ll}
	\if@VRThesisgerman{Betreuer: }\else{Supervisor: }\fi & {\@tutor}
	\end{tabular}
	\end{center}
	\end{minipage} \\
	\begin{minipage}[b]{150mm}
	\begin{center}
	\begin{tabular}{ll}
	\if@VRThesisgerman{Externer Betreuer: }\else{External supervisor: }\fi & {\@extutor}
	\end{tabular}
	\end{center}
	\end{minipage} \\
	\vspace{1.5em}
	\if@VRThesisgerman{Eingereicht am: }\else{Date of issue: }\fi {\@date} \\ % issue date
	\end{center}
	\clearpage
	\thispagestyle{empty} 
	\clearpage
	\setcounter{page}{0}
	\normalfont
\end{titlepage}
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@extutor\@empty
    \global\let\extutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\else % if titlepage
\newcommand{\maketitleMaster}{
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@extutor\@empty
    \global\let\extutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\fi
% title for commited PhD thesis (Einreichen)
\if@titlepage
\newcommand{\maketitlePhD}{
\begin{titlepage}
	\begin{center}
	\null\vfill
%	\vspace*{30mm}
	\sffamily\bfseries\selectfont\Large {\@title} \\
	\normalfont
	\vspace{4em}
	\selectfont\large
	Der Fakult{\"a}t f{\"u}r Mathematik, Informatik und Naturwissenschaften der Rheinisch-Westf{\"a}lischen Technischen	Hochschule Aachen vorgelegte Dissertation zur Erlangung des akademischen Grades {\@academictitle} \\
	\vspace{4em}
	von \\
	\vspace{2em}
	{\@author} \\
	aus {\@bornin}
	\end{center}
	\clearpage
	\thispagestyle{empty} 
	\clearpage
	\setcounter{page}{0}
	\normalfont
\end{titlepage}
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\else
\newcommand{\maketitlePhD}{
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\fi
% title for "release" version of PhD thesis (Pflichexemplare)
\if@titlepage
\newcommand{\maketitlePhDfinal}{
\begin{titlepage}
	\begin{center}
	\null\vfill
%	\vspace*{30mm}
	\sffamily\bfseries\selectfont\Large {\@title} \\ % Titel der Arbeit
	\normalfont
	\vspace{4em}
	\selectfont\large
	Von der Fakult{\"a}t f{\"u}r Mathematik, Informatik und Naturwissenschaften der 
	Rheinisch-Westf{\"a}lischen Technischen Hochschule Aachen 
	zur Erlangung des akademischen Grades {\@academictitle} genehmigte Dissertation\\ % eines Doktors der Naturwissenschaften
	\vspace{2em}
	vorgelegt von \\
	\vspace{2em}
	{\@author} \\ % Name
	aus {\@bornin} \\ % Geburtsort
	\vspace{30mm}
	\begin{minipage}[b]{90mm}
	\begin{center}
	\begin{tabular}{ll}
	Berichter: & {\@firstsupervisor} \\ % Prof. 1
	           & {\@secondsupervisor} \\ % Prof. 2
	\end{tabular}
	\end{center}
	\end{minipage} \\
	\vspace{2em}
	Tag der m{\"u}ndlichen Pr{\"u}fung: {\@date} \\ % Datum
	\vspace{2em}
%	\selectfont\normalsize 
	\@onlinesentence % online
	\end{center}
	\clearpage
	\thispagestyle{empty} 
	\clearpage
	\setcounter{page}{0}
	\normalfont
\end{titlepage}
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\else
\newcommand{\maketitlePhDfinal}{
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
    \global\let\@RWTHde\@empty
    \global\let\@RWTHen\@empty   
    \global\let\@studentid\@empty
    \global\let\studentid\relax
    \global\let\@fieldofstudy\@empty
    \global\let\fieldofstudy\relax
    \global\let\@firstsupervisor\@empty
    \global\let\firstsupervisor\relax
    \global\let\@secondsupervisor\@empty
    \global\let\secondsupervisor\relax
    \global\let\@tutor\@empty
    \global\let\tutor\relax
    \global\let\@academictitle\@empty
    \global\let\academictitle\relax
    \global\let\@bornin\@empty
    \global\let\bornin\relax
    \global\let\@onlinesentence\@empty
    \global\let\onlinesentence\relax
}
\fi

\newcommand*{\makestatement}
{
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \if@compatibility
        \setcounter{page}{0}
      \fi

\vspace*{30mm}
{
\sffamily\bfseries\selectfont\Large
\if@VRThesisgerman{Erkl\"arung}\else{Statement}\fi
}
\vspace{30mm}
\\      
\if@VRThesisgerman
{
Hiermit versichere ich, da{\ss} ich die vorliegende Arbeit selbst\"andig im Rahmen der an der RWTH Aachen \"ublichen Betreuung angefertigt und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
}
\else
{
Hiermit versichere ich, da{\ss} ich die vorliegende Arbeit selbst\"andig im Rahmen der an der RWTH Aachen \"ublichen Betreuung angefertigt und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
\vspace{10mm}
\\
I guarantee herewith that this thesis has been done independently, with support of the Virtual Reality Group at the RWTH Aachen University and no other than the referenced sources were used.
}
\fi
\vspace{30mm}
\\
Aachen, \today \hspace{10mm} .................................................
	\clearpage
	\thispagestyle{empty} 
	\clearpage
	\setcounter{page}{0}
	\normalfont
}

%%%%%%%%%%%%%%%%%%%%%%%
% Bilder
\newcounter{radius}
\newcounter{diameter}
\newcounter{linestart}
\newcounter{lineend}

\newcommand{\verttrans}[2]{
  \setcounter{diameter}{#1}
  \setcounter{radius}{\value{diameter}/2}
  \setcounter{lineend}{#2 - 3*\value{radius}}
  \begin{picture}(#1,#2)
    \path(\value{radius},\value{lineend})(\value{radius},\value{diameter})
    \setcounter{lineend}{\value{lineend} + \value{radius}} 
    \put(\value{radius},\value{lineend}){\ellipse{\value{diameter}}{\value{diameter}}}
    \put(\value{radius},\value{radius}){\blacken\ellipse{\value{diameter}}{\value{diameter}}}
    \put(\value{radius},\value{radius}){\ellipse{\value{diameter}}{\value{diameter}}}
  \end{picture}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Kopfzeile und Fu?zeilen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Logoeinstellungen:
% Groesse :height=?em
% Position vertikal: \raisbox{?em}
% Position horizontal: \hspace{?em}

\newcommand{\foottitle}{VR Group RWTH Aachen}

\newcommand{\@vrfoottext}{\raisebox{0em}[0cm]{%
    \raisebox{.15em}[0em]{\textsc\small \foottitle}}}
\newcommand{\@vcirwthfootlogo}{
  \raisebox{-.2cm}[0cm]{\includegraphics[height=.8cm]{rwth_vci_bild_schwarz_grau_cmyk}}%
}
\newcommand{\@rightlogo}{\@vcirwthfootlogo}
\newcommand{\@leftlogo}{}

\lhead[\sffamily \selectfont \textsc{\leftmark}]{}
\rhead[]{\sffamily \selectfont \textsc{\rightmark}}

\if@twoside
    \cfoot{}
    \lfoot[\thepage]{\@rightlogo}
    \rfoot[\@leftlogo]{\thepage}
\else
    \cfoot{\thepage}
    \lfoot[\@rightlogo]{\@leftlogo}
    \rfoot[\@leftlogo]{\@rightlogo}    
\fi

\fancypagestyle{plain}{
  \fancyhead{}
  \fancyfoot{}
  \if@twoside
      \fancyfoot[LO]{{\@rightlogo}}
      \fancyfoot[RO]{{\thepage}}
  \else
      \fancyfoot[L]{{\@leftlogo}}
  \fi
  \renewcommand{\headrulewidth}{0pt}
}

\pagestyle{fancy}

%\renewcommand{\chaptermark}[1]{%
%  \markboth {%
%    \ifnum \value{secnumdepth} >\m@ne
%      \thechapter\ \ %
%    \fi%
%    #1}{%
%    \ifnum \value{secnumdepth} >\m@ne
%      \thechapter\hspace{.8em}%
%    \fi%
%    #1}
%}
%
%\newcommand{\schaptermark}[1]{%
%  \markboth {%
%    #1}{%
%    #1}
%}
%
%\renewcommand{\sectionmark}[1]{%
%  \markright {%
%    \ifnum \value{secnumdepth} >\z@%
%    \thesection\hspace{.7em}%
%    \fi%
%    #1%
%  }
%}%
%\renewcommand{\subsectionmark}[1]{}

%\renewcommand\tableofcontents{%
%  \chapter*{\contentsname}
%  \addtocontents{toc}{\protect\contentsline{chapter}{\contentsname}{\thepage}{}}
%  \markboth{\contentsname}{\contentsname}%
%  \@starttoc{toc}%
%}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Formelnummern 
%% * Nummerierung der Formeln mit Kapitelnummer
%%   kombinieren
%% * Z?hler equation bei neuem Kapitel zur?cksetzen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Index
%%   * Name: Stichwortregister
%%   * Eintrag ins Inhaltsverzeichnis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewenvironment{theindex}
%{
%  \if@twocolumn
%    \@restonecolfalse
%  \else
%    \@restonecoltrue
%  \fi
%  \columnseprule \z@
%  \columnsep 35\p@
%  \twocolumn
%  \if@indexnum {
%    \chapter{\indexname}
%  }
%  \else {
%    \chapter*{\indexname}
%    \schaptermark{\indexname}
%    \addtocontents{toc}{\protect\contentsline{chapter}{\indexname}{\thepage}{}}
%  }
%  \fi
%  \parindent\z@
%  \parskip\z@ \@plus .3\p@\relax
%  \let\item\@idxitem
%}{
%  \if@restonecol\onecolumn\else\clearpage\fi%
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Literaturverzeichnis
%%   * Eintrag ins Inhaltsverzeichnis
%%   * Klein-/Gro?schreibung in mkboth beibehalten
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewenvironment{thebibliography}[1]
%{
%  \if@litnum {
%    \chapter{\bibname}%    Mit Kapitelnummer
%  }
%  \else {
%    \chapter*{\bibname}%   Ohne Kapitelnummer
%%    \schaptermark{\bibname}
%    \addtocontents{toc}{\protect\contentsline{chapter}{\bibname}{\thepage}{}}
%  }
%  \fi
%  
%  \list{\@biblabel{\@arabic\c@enumiv}}%
%  {\settowidth\labelwidth{\@biblabel{#1}}%
%    \leftmargin\labelwidth
%    \advance\leftmargin\labelsep
%    \@openbib@code
%    \usecounter{enumiv}%
%    \let\p@enumiv\@empty
%    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%  \clubpenalty4000
%  \@clubpenalty \clubpenalty
%  \widowpenalty4000%
%  \sfcode`\.\@m}
%{\def\@noitemerr
%  {\@latex@warning{Empty `thebibliography' environment}}%
%  \endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paragraph-Befehl
%% * Zeilenwechsel nach Paragraphtitel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand\section{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex \@minus 1.9ex}%
%                                   {\sffamily\large\bfseries}}
%\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex \@minus 1.0ex}%
%                                     {\sffamily\bfseries}}
%\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex \@minus 1.0ex}%
%                                     {\sffamily\bfseries}}
%\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {.5em}%
%                                    {\sffamily\normalsize\bfseries}}

% don't count paragraphs
\setcounter{secnumdepth}{3}

%set caption font
\newcommand{\VRcaptionlabelfont}{\normalfont\normalsize\bfseries}
\newcommand{\VRcaptiontextfont}{\normalfont\normalsize\mdseries}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\VRcaptionlabelfont #1: \VRcaptiontextfont #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\VRcaptionlabelfont #1: \VRcaptiontextfont #2\par}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\if@twoside
 \@openrighttrue
\fi

\newlength{\@wchapnum}
\newlength{\@wchaptitle}
\newsavebox{\@chaptitle}

\newlength{\@maxtitlewidth}
\setlength{\@maxtitlewidth}{0.7\textwidth}

\newcommand{\@chaptitleformat}{\Large\bfseries}
\newcommand{\@linelift}{.3em}

\newlength{\@wquad}
\settowidth{\@wquad}{\quad}
\newcommand{\@leftfill}{\hrulefill}
\newcommand{\@rightfill}{\hrulefill}

\def\@makechapterhead#1{%
  \vspace*{10\p@}%
  {\parindent \z@ \raggedleft \reset@font
            \scshape \sffamily\fontsize{1.5em}{1.5em}\selectfont \@chapapp{} \thechapter
        \par\nobreak
        \interlinepenalty\@M
    \Huge \sffamily \bfseries #1\par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 100\p@
  }}
\def\@makeschapterhead#1{%
  \vspace*{10\p@}%
  {\parindent \z@ \raggedleft \reset@font
            \scshape \sffamily\fontsize{1.5em}{1.5em}\selectfont \vphantom{\@chapapp{} \thechapter}
        \par\nobreak
        \interlinepenalty\@M
    \Huge \sffamily \bfseries #1\par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 100\p@
  }}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Neudefinition von \see und \seealso
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\see}[2]{\textit{\seename} #1}
%\providecommand{\seealso}[2]{}  % sicherstellen, dass der befehl
%                                % existiert. Alte Version von AMSmath
%                                % definiert dieses Commande n?mlich nicht.
%\renewcommand{\seealso}[2]{\textit{\alsoname} #1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% L?ngendefinitionen f?r Math-Umgebungen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\setlength{\arraycolsep}{5pt}  
%                                % Standard: 5pt
%                                % halbe Breite des horizontalen Spaltenzwischenraums,
%                                % der in einer aray-Umgebung definiert wird.
%
%\setlength{\jot}{4pt}          
%                                % Standard: 3pt
%                                % zus?tzlicher vertikaler Zwischenraum bei 
%                                % eqnarray(*) zwischen den Zeilen
%\setlength{\mathindent}{2.5em} 
%                                % Standard: Einr?ckung einer Liste erster Ebene
%                                %           normalerweise 2.5em
%                                % Einzug vom Linken Rand bei Verwendung der 
%                                % Klassenoption fleqn
%
%% mit der Klassenoption fleqn haben die folgenden L?ngen keine Auswirkung
%% Es wird stattdessen immer  \topsep benutzt (wird weiter oben gesetzt)
%\setlength{\abovedisplayskip}{12pt plus 3pt minus 9pt} 
%                                % Standard: 12pt plus 3pt minus 9pt
%                                % Leerraum ?ber langer Formel
%\setlength{\belowdisplayskip}{12pt plus 3pt minus 9pt} 
%                                % Standard: 12pt plus 3pt minus 9pt
%                                % Leerraum unter langer Formel
%\setlength{\abovedisplayshortskip}{0pt plus 3pt} 
%                                % Standard: 0pt plus 3pt
%                                % Leerraum ?ber kurzer Formel
%\setlength{\belowdisplayshortskip}{7pt plus 3pt minus 9pt} 
%                                % Standard: 7pt plus 3pt minus 4pt
%                                % Leerraum unter kurzer Formel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Neue Umgebung f?r Beweise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\theoremstyle{definition}
\newtheorem{beweis}{Beweis}
\renewenvironment{proof}{%
\begin{beweis}%
}{%
\qed%
\end{beweis}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Anpassung f?r Floatobjekte
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\floatpagefraction}{.9}
%\renewcommand{\textfraction}{.2}
%\renewcommand{\topfraction}{.57}
%\renewcommand{\bottomfraction}{.57}

\endinput

