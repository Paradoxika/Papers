%% This is file `iosart2x.cls'. Forked from 'iosart2c.cls' with additions from 'ios2a.cls'.
%%
%% LaTeX 2e class file for articles in the journals:
%%   Journal of Ambient Intelligence and Smart Environments (AIS)
%%   Semantic Web (SW)
%%   Web Intelligence (WEB)
%%  -
%%   Argument & Computation (AAC)
%%   Applied Ontology (AO)
%%   Asymptotic Analysis (ASY)
%%   Biorheology (BIR)
%%   Bio-Medical Materials and Engineering (BME)
%%   Biomedical Spectroscopy and Imaging (BSI)
%%   Information Services &  Use (ISU)
%%   Journal of Computer Security (JCS)
%%   Journal of High Speed Networks (JHS)
%%   Journal of Integrative Neuroscience (JIN)
%%   Journal of Neutron Research (JNR)
%%   Strength, Fracture and Complexity (SFC)
%%  -
%%   AI Communications (AIC)
%%   Risk and Decision Analysis (RDA)
%%  -
%%   International Shipbuilding Progress (ISP)
%%  -
%%   Computability (COM)
%%
%% published by IOS Press, The Netherlands 
%%
%% Macros written by VTeX Ltd., Lithuania for IOS Press, The Netherlands
%% Please submit bugs or your comments to vtex@vtex.lt
%%
%% You are free to use this class file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%

\def\fmt@name{iosart2x}
\def\fmt@date{2016/11/03}
\def\fmt@version{1.0.1}
\NeedsTeXFormat{LaTeX2e}[2000/01/26]
\ProvidesClass\fmt@name
              [\fmt@date\space v\fmt@version\space IOS Press]

\newif\if@restonecol \@restonecolfalse
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\newif\if@nameyear \@nameyearfalse

\DeclareOption{10pt}{\let\eleven@pt\relax}
\DeclareOption{11pt}{\def\eleven@pt{}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{onecolumn}{\@twocolumnfalse\@restonecoltrue}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}%
\newif\if@rotating@loaded \@rotating@loadedfalse
\DeclareOption{rotating}{%
  \@rotating@loadedtrue
  \AtEndOfClass{\RequirePackage[dvips,counterclockwise,figuresright]{rotating}}}
\DeclareOption{crcready}{\AtBeginDocument{\gdef\rtitleheadline{}\gdef\@copyright{}%
\pagestyle{empty}\relax
}}%

\newif\if@reducehelvetica \@reducehelveticatrue
\DeclareOption{normalhelvetica}{\global\@reducehelveticafalse}

\let\@copyrightowner@rights\@firstofone
\newif\if@open@access \@open@accessfalse
\DeclareOption{openaccess}{\global\@open@accesstrue\global\let\@copyrightowner@rights\phantom}

\newif\if@autobibl \@autobibltrue
\DeclareOption{noautobibl}{\global\@autobiblfalse}

% Numbering switches:
\newif\if@seceqn   \@seceqnfalse   \DeclareOption{seceqn}{\@seceqntrue}
\newif\if@secfloat \@secfloatfalse \DeclareOption{secfloat}{\@secfloattrue}
\newif\if@secthm                   \DeclareOption{secthm}{\@secthmtrue}

% Information about journal

\gdef\@issn{0000-0000}
\gdef\@price{00.00}
\gdef\@journal{Undefined}
\def\@publisher{IOS Press}
\def\@publisheraddress{Nieuwe Hemweg 6B, 1013 BG Amsterdam, The Netherlands}
\def\@copyrightowner{ -- \@@copyrightowner}
\def\@@copyrightowner{IOS Press and the authors. \@copyrightowner@rights{All rights reserved}}

\gdef\ios@journal@layout{-1}%

%%% 0 layout %%%

\DeclareOption{ais}{%
  \gdef\@jid{ais}%
  \gdef\@JID{AIS}%
  \gdef\@issn{1876-1364}%
  \gdef\@eissn{1876-1372}%
  \gdef\@price{35.00}%
  \gdef\@journal{Journal of Ambient Intelligence and Smart Environments}%
  \global\@twocolumntrue
  \gdef\ios@journal@layout{0}%
}

\DeclareOption{sw}{%
  \gdef\@jid{sw}%
  \gdef\@JID{SW}%
  \gdef\@issn{1570-0844}%
  \gdef\@eissn{2210-4968}%
  \gdef\@price{35.00}%
  \gdef\@journal{Semantic Web}%
  \global\@twocolumntrue
  \gdef\ios@journal@layout{0}%
}

\DeclareOption{web}{%
  \gdef\@jid{web}%
  \gdef\@JID{WEB}%
  \gdef\@issn{2405-6456}%
  \gdef\@eissn{2405-6464}%
  \gdef\@price{35.00}%
  \gdef\@journal{Web Intelligence}%
  \global\@twocolumntrue
  \gdef\ios@journal@layout{0}%
}

%%% 1 layout %%%

\DeclareOption{aac}{%
  \gdef\@jid{aac}
  \gdef\@JID{AAC}
  \gdef\@issn{1946-2166}
  \gdef\@eissn{1946-2174}%
  \gdef\@price{35.00}%
  \gdef\@journal{Argument \& Computation}
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

\DeclareOption{ao}{%
  \gdef\@jid{ao}
  \gdef\@JID{AO}
  \gdef\@issn{1570-5838}
  \gdef\@eissn{1875-8533}%
  \gdef\@price{35.00}%
  \gdef\@journal{Applied Ontology}
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
  \def\tagbib@style{bibstyle2}% IOS 2
  \global\@nameyeartrue
}

\DeclareOption{asy}{%
  \gdef\@jid{asy}
  \gdef\@JID{ASY}
  \gdef\@issn{0921-7134}
  \gdef\@eissn{1875-8576}%
  \gdef\@price{35.00}%
  \gdef\@journal{Asymptotic Analysis}%
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

\DeclareOption{bir}{%
  \gdef\@jid{bir}
  \gdef\@JID{BIR}
  \gdef\@issn{0006-355X}
  \gdef\@eissn{1878-5034}%
  \gdef\@price{35.00}%
  \gdef\@journal{Biorheology}
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
  \def\tagbib@style{vancouver}%
}

\DeclareOption{bme}{%
  \gdef\@jid{bme}
  \gdef\@JID{BME}
  \gdef\@issn{0959-2989}
  \gdef\@eissn{1878-3619}%
  \gdef\@price{35.00}%
  \gdef\@journal{Bio-Medical Materials and Engineering}
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

\DeclareOption{bsi}{%
  \gdef\@jid{bsi}
  \gdef\@JID{BSI}
  \gdef\@issn{2212-8794}
  \gdef\@eissn{2212-8808}%
  \gdef\@price{35.00}%
  \gdef\@journal{Biomedical Spectroscopy and Imaging}
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

\DeclareOption{isu}{%
  \gdef\@jid{isu}%
  \gdef\@JID{ISU}%
  \gdef\@issn{0167-5265}%
  \gdef\@eissn{1875-8789}%
  \gdef\@price{35.00}%
  \gdef\@journal{Information Services \&  Use}
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

\DeclareOption{jcs}{%
  \gdef\@jid{jcs}%
  \gdef\@JID{JCS}%
  \gdef\@issn{0926-227X}
  \gdef\@eissn{1875-8924}%
  \gdef\@price{35.00}%
  \gdef\@journal{Journal of Computer Security}%
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

\DeclareOption{jhs}{%
  \gdef\@jid{jhs}%
  \gdef\@JID{JHS}%
  \gdef\@issn{0926-6801}
  \gdef\@eissn{1875-8940}%
  \gdef\@price{35.00}%
  \gdef\@journal{Journal of High Speed Networks}
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  % 10pt
}

% new journal upcoming in 2017
\DeclareOption{jin}{%
  \gdef\@jid{jin}%
  \gdef\@JID{JIN}%
  \gdef\@issn{0219-6352}%
  \gdef\@eissn{1757-448X}%
  \gdef\@price{35.00}%
  \gdef\@journal{Journal of Integrative Neuroscience}%
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

\DeclareOption{jnr}{%
  \gdef\@jid{jnr}%
  \gdef\@JID{JNR}%
  \gdef\@issn{1023-8166}%
  \gdef\@eissn{1477-2655}%
  \gdef\@price{35.00}%
  \gdef\@journal{Journal of Neutron Research}%
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  % 10pt
}

\DeclareOption{sfc}{%
  \gdef\@jid{sfc}
  \gdef\@JID{SFC}
  \gdef\@issn{1567-2069}
  \gdef\@eissn{1875-9262}%
  \gdef\@price{35.00}%
  \gdef\@journal{Strength, Fracture and Complexity}%
  \gdef\ios@journal@layout{1}%
  \global\@twocolumnfalse \global\@restonecoltrue
  \gdef\eleven@pt{}%
}

%%% 2 layout %%%

\DeclareOption{aic}{%
  \gdef\@jid{aic}
  \gdef\@JID{AIC}
  \gdef\@issn{0921-7126}
  \gdef\@eissn{1875-8452}%
  \gdef\@price{35.00}%
  \gdef\@journal{AI Communications}
  \gdef\ios@journal@layout{2}%
  \global\@twocolumntrue \global\@restonecolfalse
  % 10pt
}

\DeclareOption{rda}{%
  \gdef\@jid{rda}
  \gdef\@JID{RDA}
  \gdef\@issn{1569-7371}
  \gdef\@eissn{1875-9173}%
  \gdef\@price{35.00}%
  \gdef\@journal{Risk and Decision Analysis}
  \gdef\ios@journal@layout{2}%
  \global\@twocolumntrue \global\@restonecolfalse
  % 10pt
}

%%% 3 layout %%%

\DeclareOption{isp}{%
  \gdef\@jid{isp}
  \gdef\@JID{ISP}
  \gdef\@issn{0020-868X}
  \gdef\@eissn{1566-2829}%
  \gdef\@price{35.00}%
  \gdef\@journal{International Shipbuilding Progress}
  \gdef\ios@journal@layout{3}%
  \global\@twocolumnfalse \global\@restonecoltrue
  % 10pt
}

%%% 4 layout %%%

\DeclareOption{com}{%
  \gdef\@jid{com}
  \gdef\@JID{COM}
  \gdef\@issn{2211-3568}
  \gdef\@eissn{2211-3576}%
  \gdef\@price{35.00}%
  \gdef\@journal{Computability}
  \gdef\ios@journal@layout{4}%
  \global\@twocolumnfalse \global\@restonecoltrue
  % 10pt
}

%%% meta layout %%%

\DeclareOption{ch}{%
  \gdef\@jid{ch}%
  \gdef\@JID{CH}%
  \gdef\@issn{1386-0291}%
  \gdef\@eissn{1875-8622}%
  \gdef\@price{35.00}%
  \gdef\@journal{Clinical Hemorheology and Microcirculation}%
  \global\@twocolumntrue
  \gdef\ios@journal@layout{0}%
}

\DeclareOption{inf}{%
  \gdef\@jid{inf}%
  \gdef\@JID{INF}%
  \gdef\@issn{0868-4952}%
  \gdef\@eissn{1822-8844}%
  \gdef\@price{35.00}%
  \gdef\@journal{Informatica}%
  \global\@twocolumntrue
  \gdef\ios@journal@layout{0}%
}

%%% class versions for users %%%

\def\iosx@version{100}% initial version
\DeclareOption{v1.0.1}{\xdef\iosx@version{101}\wlog{\fmt@name\space user version 1.0.1: math cases non-display style}}
\DeclareOption{v1.0.2}{\xdef\iosx@version{102}\wlog{\fmt@name\space user version 1.0.2: upqed at end of line}}
\DeclareOption{v1.0.3}{\xdef\iosx@version{103}\wlog{\fmt@name\space user version 1.0.3: 0 layout algorithms}}
\DeclareOption{v1.0.4}{\xdef\iosx@version{104}\wlog{\fmt@name\space user version 1.0.4: new paragraph after theorem environment}}
\DeclareOption{v1.1.0}{\xdef\iosx@version{110}\wlog{\fmt@name\space user version 1.1.0: no algorithm definitions}}
\DeclareOption{v1.1.1}{\xdef\iosx@version{111}\wlog{\fmt@name\space user version 1.1.1: standard itshape in plain theorem style, standard @setref}}
\DeclareOption{v1.1.2}{\xdef\iosx@version{112}\wlog{\fmt@name\space user version 1.1.2: bid syntax for doi output}}


%**************** options to amsmath
\PassOptionsToPackage{fleqn}{amsmath}

\ExecuteOptions{twoside,final,openright,fleqn}
\ProcessOptions

\RequirePackage{etoolbox}

% class cfg load
\long\def\@if@vtex@in@house#1#2{\@ifundefined{vtex@in@house}{#2}{#1}}
\IfFileExists{\fmt@name-vtex.cfg}{%
  \xdef\vtex@in@house{1}
  \input\fmt@name-vtex.cfg
}{
  \input\fmt@name.cfg
}

\csuse{\fmt@name @load@dummy@layout}

\csuse{\fmt@name @load@class@version@if}

\csuse{\fmt@name @load@openaccess@check}

\csuse{\fmt@name @load@vkt@cmn@md}

\def\qq@text{TO BE UPDATED}

\def\dbl@error#1{\@latex@error{#1}\@ehc\special{mt:error #1}}

%************************* LAYOUTS

\def\common@settings@from@ios@two@a{%
  % math
  \def\tfrac##1##2{{\textstyle\frac{##1}{##2}}}
  \def\dfrac##1##2{{\displaystyle\frac{##1}{##2}}}
  \def\dvt{\colon\ }
  \def\dvtx{\nobreak\,\colon\relax}
  \let\ge\geqslant
  \let\geq\geqslant
  \let\le\leqslant
  \let\leq\leqslant
  \AtEndOfClass{\mathindent2em}
  \renewcommand{\Bigg}{\bBigg@{2.6}}
  % fonts
  \let\rtitleheadline@size\footnotesize
  % title
  \b@pretitle@skip=6pt
  % author
  \b@author@skip=12\p@
  % abstract
  \abstract@skip=18\p@
  % keywords
  \keywords@skip=6\p@
  \keywords@noabs@skip=18\p@
  % frontmatter
  \b@section@skip=24pt plus6pt minus6pt%
  % (page) breaking penalties
  \tolerance=1600
  \hbadness=1600
  \interdisplaylinepenalty=100
  % footnotes
  \setlength{\skip\footins}{12\p@ \@plus 6\p@}
  \skip\@mpfootins = \skip\footins
  % biblio
  \def\biblio@clubpenalty{8000}
  \def\biblio@widowpenalty{7000}
  \@ifversionge{111}
    {}
    {\if@nameyear\else
       \renewcommand\NAT@open{\textup{[}}%
       \renewcommand\NAT@close{\textup{]}}%
       \renewcommand\NAT@sep{\textup{,}}%
     \fi
     \def\citenumfont##1{\textup{##1}}}%
  \def\NAT@penalty{\penalty50}
  \setlength{\bibhang}{12pt}
  \bibsep\z@ \@plus.5\p@
  \appto\bibpreamble{\leftmargin12\p@\labelsep5\p@}
  % boxes
  \hfuzz=0.1\p@
}% end of common@settings@from@ios@two@a

\@namedef{init@ios@journal@1@layout}{% B type from ios2a
  \common@settings@from@ios@two@a
  % (page) breaking penalties
  \clubpenalty=4000
  \widowpenalty=4000
  \predisplaypenalty=10000   % Breaking before a math display.
  \adjdemerits=10000
  \doublehyphendemerits=10000
  \brokenpenalty=100
  % abstract
  \def\abstract@size{\footnotesize}
  % theorems
  \def\proof@topsep{11pt plus 3pt}
  % lists
  \def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ \@plus2\p@ \@minus\p@
            \topsep 9\p@ \@plus2\p@ \@minus2\p@
            \partopsep\p@
            \itemsep 1\p@ \@plus.5\p@ \@minus1\p@}
  \let\@listi\@listI
  \@listi
}

\@namedef{init@ios@journal@2@layout}{% A type from ios2a
  \common@settings@from@ios@two@a
  % math
  \AtEndOfClass{\mathindent20\p@}
  % table
  \setlength\tablewidth{217.66pt}
  % lists
  \leftmargini=25pt
  \leftmargin\leftmargini
  \leftmarginv=10pt
  \leftmarginvi=10pt
  \setlength  \labelwidth{\leftmargini}
  \addtolength\labelwidth{-\labelsep}
  % other (new tune-up)
  \b@pretitle@skip=16.5pt
}

\@namedef{init@ios@journal@3@layout}{% C type from ios2a
  \common@settings@from@ios@two@a
  \@nameuse{init@ios@journal@1@layout}% B type from ios2a
  % title
  \@@topskip=12pt
  % frontmatter
  \b@section@skip=36pt plus2pt minus6pt
  % fonts
 \def\pretitle@size{\normalsize}
 \def\title@size{\Large\bfseries\mathversion{bold}}
 \def\subtitle@size{\normalsize\itshape}
 \def\address@size{\footnotesize\itshape}
 \let\rtitleheadline@size\scriptsize
 \let\rtitleheadline@pagesize\scriptsize
 % abstract
 \def\abstract@indent{}
 \def\abstractname{}
 \def\abstractname@sep{}
 % theorems
 \def\proof@topsep{11pt plus 3pt}
}

\@namedef{init@ios@journal@4@layout}{% D type from ios2a
  \common@settings@from@ios@two@a
  % footnotes
  \setlength\footnotesep{9.4\p@}%
  \setlength{\skip\footins}{10\p@ \@plus 2\p@ \@minus 2\p@}%
  \skip\@mpfootins = \skip\footins
  \def\initsline@vskip{10ex}
  \def\footnoterule{\kern-3\p@
    \hrule width\textwidth
    \kern 2.6\p@}
  % floats
  \setlength\floatsep    {20\p@ \@plus 2\p@ \@minus 0\p@}
  \setlength\textfloatsep{17\p@ \@plus 4\p@ \@minus 0\p@}
  \setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 0\p@}
  \setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 0\p@}
  \setlength\dbltextfloatsep{15\p@ \@plus 4\p@ \@minus 0\p@}
  \@fpsep 8pt plus 2fil
  \@dblfpsep 8pt plus 2fil
  \renewcommand\figurename{Figure}
  \def\fnum@figure{\textbf{\figurename~\thefigure.}}
  % (page) breaking penalties
  \adjdemerits=10000
  \brokenpenalty=10000
  \clubpenalty=4000
  \doublehyphendemerits=10000
  \widowpenalty=4000
  % title
  \b@pretitle@skip-10\p@% agreement with editor, same space with B type projects
  \def\title@size{\fontsize{14.4}{18}\selectfont\bfseries\mathversion{bold}}%
  \advance\@@topskip by -3.5\p@
  \a@title@skip\z@
  % authors/addresses
  \b@author@skip9\p@
  \def\authors@size{\normalsize}
  \def\address@size{\footnotesize}
  \let\ioscom@author@optarg\author@optarg
  \def\author@optarg[##1]##2{%
    \vskip3pt plus .1\p@ minus .1\p@
    \ioscom@author@optarg[##1]{##2}%
    \ifx.##1.\ioscom@printaddress{}\else\@for\@tempa:=##1\do{\ioscom@printaddress\@tempa}\fi\endgraf}%
  \csuse{\fmt@name @load@ioscom@printaddress}
  \let\add@addressref\@gobble
  \def\address{\@ifnextchar[{\ioscom@address}{\ioscom@address[]}}
  \def\ioscom@address[##1]##2{%
    \def\ioscom@tmp{##2}%
    \protected@write\@auxout{}{\string\global\string\@namedef{ioscom@##1@address}{\expandafter\strip@prefix\meaning\ioscom@tmp}}%
  }%
  % abstract
  \def\abstract@size{\small}
  \abstract@skip=16pt plus .5pt minus .5pt
  % keywords
  \keywords@skip=13pt plus .5pt minus .5pt
  \def\keywordsname{\textbf{Keywords}\textbf}
  % frontmatter
  \b@section@skip=15pt plus1pt minus1pt
  \g@addto@macro\close@fm{%
    \global\@afterindentfalse
    \aftergroup\@afterheading%
  }
  % biblio
  \let\bibfont\normalsize
  \@ifversionge{111}
    {\renewcommand\NAT@sep{,\NAT@penalty}}
    {\renewcommand\NAT@sep{\textup{,}\NAT@penalty}}%
  % sections
  \def\section@style{\fontsize{13}{15}\bfseries\selectfont\mathversion{bold}\nohyphen\raggedright}
  \def\sectionpart@style{\fontsize{13}{15}\bfseries\selectfont\mathversion{bold}\nohyphen\raggedright}
  \def\subsection@style{\fontsize{11}{13}\bfseries\selectfont\nohyphen\raggedright}
  \def\subsubsection@style{\normalsize\nohyphen\raggedright}
  \def\paragraph@style{\normalsize\itshape\raggedright}
  \def\subparagraph@style{\paragraph@style}
  \def\section@beforeskip{15\p@ \@plus -4\p@}
  \def\sectionpart@beforeskip{-10\p@ \@plus -3\p@ \@minus -1\p@}
  \def\subsection@beforeskip{-15\p@ \@plus -3\p@}
  \def\subsubsection@beforeskip{-15\p@ \@plus -3\p@}
  \def\paragraph@beforeskip{-6\p@ \@plus -3\p@}
  \def\subparagraph@beforeskip{-0.1\p@}
  \def\section@afterskip{5\p@ \@plus 0.5\p@}
  \def\sectionpart@afterskip{4\p@ \@plus 2\p@ \@minus 0.5\p@}
  \def\subsection@afterskip{3\p@ \@plus 0.3\p@}
  \def\subsubsection@afterskip{3\p@ \@plus 0.3\p@}
  \def\paragraph@afterskip{-1em}
  \def\subparagraph@afterskip{-1em}
  \def\subparagraph@indent{1em}
  %copyright
  \let\rtitleheadline@size\scriptsize
  \def\copyright@size{\scriptsize}
  \def\copyright@vskip{\vskip36.2pt}
  % lists
  \def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ \@plus2\p@ \@minus\p@
            \topsep 9\p@ \@plus2\p@ \@minus2\p@
            \partopsep\p@
            \itemsep 1\p@ \@plus.5\p@ \@minus1\p@}
  \let\@listi\@listI
  \@listi
  % theorems
  \def\mathend@qed{\hbox to\hsize{\hfill$\Box$}}
  \def\qed{%
    \ifmmode\hfill\Box \else
      \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill\nobreak$\Box$%
    \fi}
  \def\proof@topsep{11pt plus 3pt}
  % hyper
  \AtEndOfClass{%
    \urlstyle{tt}%
    \let\ioscom@href\href
    \def\href##1##2{\ioscom@href{##1}{\texttt{##2}}}
  }
}% end of 4th layout

\def\init@ios@journal@INF@settings{
  \def\theaddress{\arabic{address}}
  \def\@@copyrightowner{Vilnius University}
  \def\@publisher{Vilnius University Institute of Mathematics and Informatics}
  \def\@publisheraddress{Akademijos 4, LT-08663 Vilnius, Lithuania}
}

\def\init@ios@journal@AAC@settings{%
  \AtBeginDocument{\mandatory@open@access@option@error}%
}

\def\init@ios@journal@ASY@settings{%
  \gappto\@articletype@prehook{\global\let\ios@pages@trimbox\ios@pages@trimbox@asy}%
}

\def\init@ios@journal@COM@settings{%
  \appto\before@printead@hook{%
    \let\ead@prefixsep\relax
    \let\ead@prefix@fax\relax
    \let\ead@prefix@url\relax
    \let\ead@prefix@email\relax
    \let\ead@prefix@phone\relax
    \let\ead@prefix@m@fax\relax
    \let\ead@prefix@m@url\relax
    \let\ead@prefix@m@email\relax
    \let\ead@prefix@m@phone\relax
    }%
  }

%************************* FONTS

\ifnum\ios@journal@layout>\z@
\def\@xipt{11}
\def\@xivpt{14}
\def\@xviipt{17}
\def\@xviiipt{18}
\def\@xxpt{20}
\def\@xxivpt{24}
\def\@xxvpt{25}
\fi

% Fonts:
\@ifundefined{eleven@pt}{
\typeout{Ten point}
\ifnum\ios@journal@layout>\z@% ios2a 10pt
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{12pt plus .5\p@ minus .5\p@}%
   \abovedisplayskip 12\p@ \@plus2\p@ \@minus2\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
%
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 11\p@ \@plus2\p@
   \belowdisplayskip \abovedisplayskip
   \def\@listi{\leftmargin\leftmargini
               \topsep 5\p@ \@plus2\p@ \@minus2\p@
               \parsep \p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt\@xpt%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 5\p@ \@plus\p@ \@minus\p@
               \parsep \p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\else
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{12pt plus .5\p@ minus .1\p@}%
   \abovedisplayskip 12\p@ \@plus2pt \@minus2pt%
   \abovedisplayshortskip\abovedisplayskip%
   \belowdisplayshortskip\abovedisplayskip%
   \belowdisplayskip \abovedisplayskip%
   \let\@listi\@listI}
\newcommand\small{%
   \@setfontsize\small\@ixpt\@xipt%
   \abovedisplayskip 11\p@ \@plus3pt%
   \abovedisplayshortskip 11\p@ \@plus1pt \@minus1pt%
   \belowdisplayshortskip 11\p@ \@plus1pt \@minus1pt%
   \def\@listi{\leftmargin\leftmargini
               \topsep 5\p@ \@plus2\p@ \@minus2\p@
               \parsep \z@ \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt\@xpt%
   \abovedisplayskip 10\p@ \@plus3pt%
   \abovedisplayshortskip 10\p@ \@plus1pt \@minus1pt%
   \belowdisplayshortskip 10\p@ \@plus1pt \@minus1pt%
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep \z@ \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
\fi
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\newcommand\large{\@setfontsize\large\@xipt{13}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
}{%
\typeout{Eleven point}
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xipt{13pt plus .5\p@ minus .1\p@}%
   \abovedisplayskip 13\p@ \@plus3pt \@minus3pt%
   \abovedisplayshortskip\abovedisplayskip%
   \belowdisplayshortskip\abovedisplayskip%
   \belowdisplayskip \abovedisplayskip%
   \let\@listi\@listI}

\newcommand\small{%
   \@setfontsize\small\@xpt\@xiipt%
   \abovedisplayskip 6.5\p@ \@plus3pt%
   \abovedisplayshortskip 6.5\p@ \@plus1pt \@minus1pt%
   \belowdisplayshortskip 6.5\p@ \@plus1pt \@minus1pt%
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep \z@ \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip%
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@ixpt{10}%
   \abovedisplayskip 6.5\p@ \@plus3pt%
   \abovedisplayshortskip 6.5\p@ \@plus1pt \@minus1pt%
   \belowdisplayshortskip 6.5\p@ \@plus1pt \@minus1pt%
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep \z@ \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip%
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
}
\normalsize

% Customization of fonts
\renewcommand\sldefault{it}
\renewcommand\bfdefault{b}
\let\slshape\itshape

% ********************* DIMENSIONS:

% TEXT DIMENSIONS
\setlength\parindent{10\p@}
\ifcase\ios@journal@layout
\setlength\textwidth{460\p@} %162mm
\or
\setlength\textwidth{160mm}
\or
\setlength\textwidth{162mm}
\or
\setlength\textwidth{118mm}
\or
\setlength\textwidth{162mm}
\setlength\parindent{5.5mm}%
\fi

\setlength\textheight{50\baselineskip}
\advance\textheight by \topskip
\ifnum\ios@journal@layout=\@ne
\setlength\textheight{206mm} %42*13 lines
\fi
\ifnum\ios@journal@layout=\thr@@
\setlength\textheight{180mm}
\fi
\ifnum\ios@journal@layout=4
\addtolength\textheight{-15.1\p@}
\fi


\setlength\columnsep{26\p@}  %9mm 
\ifnum\ios@journal@layout>\@ne\setlength\columnsep{9mm}\fi
\setlength\columnwidth{217\p@}
\def\footnoterule@width{\the\columnwidth}
\setlength\columnseprule{0\p@}

\csuse{\fmt@name @load@pagecrop}

\gappto\PROOF{\AtBeginDocument{%
  \ifnum\@volume=\m@ne
    \ifnum\@issue=\m@ne
      \xdef\prepress@stage{1}%
      \protected@write\@auxout{}{\string\xdef\string\prepress@stage{1}}%
    \fi
  \fi
}}

\AtBeginDocument{\csnumdef{totalpages}{\@lastpage -\@firstpage + 1}}

\let\@id@line@text\@id@line

\def\fp@id@line@addon{}

\def\prepress@id@line@text{[\@articletype]\hfill p.~\number\@@@sheetcount/\totalpages\fp@id@line@addon}
\def\vtex@id@line@text{\@JID\ (\fmt@name\ \fmt@date\ v\fmt@version)\hfill\jobname.tex\ \TODAY\ \timenow\hfill 
    [\@articletype]\hfill p.~\number\@@@sheetcount/\totalpages}
\appto\HPROOF{%
  \let\@id@line@text\vtex@id@line@text
  \def\fp@id@line@addon{\\PRETITLE: {\usefont{T1}{lmtt}{m}{n}\fontsize{8}{8}\selectfont\@pretitle}}%
}
\gappto\PROOF{\AtBeginDocument{%
  \let\@id@line@text\vtex@id@line@text
  \def\fp@id@line@addon{\\PRETITLE: {\usefont{T1}{lmtt}{m}{n}\fontsize{8}{8}\selectfont\@pretitle}}%
  \@ifundefined{prepress@stage}{}{%
    \let\fp@id@line@addon\relax
    \let\@id@line@text\prepress@id@line@text
  }}}
\csdef{@id@line}{\raise3pc\hbox{\special{vtex:bmc.artifact.idline}% for dvi differ
  \parbox[t]{\textwidth}{\@id@line@text\fp@id@line@addon\global\let\fp@id@line@addon\relax%
  }\special{vtex:emc.artifact.idline}}%
}
\def\vtexed#1{}
\g@addto@macro\PROOF\SETGRID

%% Centering on A4 page
\hoffset=-1in
\voffset=-1.15mm
\def\paper@width{210mm}\paperwidth=210mm
\def\paper@height{297mm}\paperheight=297mm
\@tempdima=\paper@width
\advance\@tempdima by-\textwidth
\divide\@tempdima  by2

% HEADS:
\setlength\headheight{12\p@}
\setlength\headsep   {15\p@}
\setlength\topskip   {10\p@}
\setlength\footskip  {25\p@}
\setlength\maxdepth  {.5\topskip}

\ifnum\ios@journal@layout=4
\setlength\headheight{5.6\p@}
\setlength\headsep{28.5pt}
\setlength\topskip{6.9\p@}
\setlength\footskip{11pt}
\setlength\maxdepth{4\p@}
\fi

% SIDE MARGINS
\setlength\oddsidemargin   {\@tempdima}
\setlength\evensidemargin  {\@tempdima}
\setlength\topmargin       {10mm}%
\ifcase\ios@journal@layout\or
\addtolength\topmargin{1.5mm}
\or
\addtolength\topmargin{-5.9\p@}
\or
\addtolength\topmargin{43\p@}
\or
\addtolength\topmargin{5.06\p@}
\fi

% TEXT PARAMETERS
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@}

% BREAKS
\setlength\smallskipamount{6\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{12\p@ \@plus 2\p@ \@minus 3\p@} %%DG
\setlength\bigskipamount{24pt \@plus 6\p@ \@minus 6\p@}  

\ifcase\ios@journal@layout\or% 1
\setlength\medskipamount{12\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\bigskipamount{24\p@ \@plus 3\p@ \@minus 3\p@}
\or%2
\setlength\medskipamount{12pt plus12pt minus3pt}
\else%3+4
\setlength\medskipamount{12\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\bigskipamount{24\p@ \@plus 3\p@ \@minus 3\p@}
\fi

% PAGE-BREAKING PENALTIES
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=50
\ifnum\ios@journal@layout=\tw@
\widowpenalty=1000
\clubpenalty=1000
\displaywidowpenalty=0
\predisplaypenalty=0
\fi
%
\pretolerance=100
\tolerance=800
\hbadness=800
\ifnum\ios@journal@layout>\z@
\emergencystretch=\z@
\else
\emergencystretch=3\p@
\fi
\hfuzz=1\p@

\doublehyphendemerits=0
\adjdemerits=0
\brokenpenalty=0
\interlinepenalty=0

\if@twocolumn
 \setlength\marginparsep {10\p@}
 \ifnum\ios@journal@layout=\tw@
  \setlength\marginparsep{7\p@}
 \fi
\else
  \setlength\marginparsep{7\p@}
\fi
\setlength\marginparpush{5\p@}

\ifnum\ios@journal@layout=4
\setlength\marginparwidth {.75in}
\setlength\marginparsep{7\p@}
\setlength\marginparpush{5\p@}
\fi

% FOOTNOTES
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{18\p@ \@plus 6\p@}

% FLOATS
\setlength\floatsep    {15\p@ \@plus 10\p@ \@minus 4\p@}
\setlength\textfloatsep{12\p@ \@plus 6\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 6\p@ \@minus 4\p@}
\setlength\dblfloatsep    {15\p@ \@plus 10\p@ \@minus 4\p@}
\setlength\dbltextfloatsep{12\p@ \@plus 12\p@ \@minus 4\p@}

%  For floats on a separate float page or column:
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 1000fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 1000fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}

\setcounter{topnumber}{5}
\renewcommand\topfraction{.90}
\setcounter{bottomnumber}{5}
\renewcommand\bottomfraction{.90}
\setcounter{totalnumber}{10}
\renewcommand\textfraction{.10}
\renewcommand\floatpagefraction{.9}
\setcounter{dbltopnumber}{5}
\renewcommand\dbltopfraction{.99}
\renewcommand\dblfloatpagefraction{.8}

% PENALTIES
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

% LISTS
\setlength\partopsep{0\p@}
\def\@listI{\leftmargin\leftmargini
  \topsep 6pt plus 3pt minus 3pt            % 9pt +3 -3
  \partopsep 3pt plus 1pt minus 2pt
  \itemsep 0pt plus 0.5pt minus 1pt
\parsep0pt}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    0\p@ \@plus1\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\DeclareMathSizes{\@xivpt}{\@xivpt}{\@xpt}{\@viiipt}
\DeclareMathSizes{12}{12}{\@viiipt}{\@viipt}

% ******************** HEADINGS
% normal heading
\csuse{\fmt@name @load@ps@headings}

% empty RH
\def\ps@empty{\let\@mkboth\@gobbletwo
     \def\@oddhead{\hfill}\def\@oddfoot{}
\let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

% RH  with pagenumber at bottom
\def\ps@plain{\let\@mkboth\@gobbletwo
     \def\@oddhead{\hfill}\def\@oddfoot{}
\let\@evenhead\@oddhead
  \def\@oddfoot{\hfill\footnotesize\thepage\hfill}
  \let\@evenfoot\@oddfoot
}

\let\copyright@size\footnotesize
\def\copyright@vskip{\vskip10pt}
\def\ps@copyright{\let\@mkboth\@gobbletwo
  \def\@evenhead{\parbox[t]{\textwidth}{\ltitleheadline}}%
  \def\@oddhead{\parbox[t]{\textwidth}{\rtitleheadline}}%
  \def\@oddfoot{\parindent 0pt
    \parbox{\textwidth}{\copyright@vskip\copyright@size\@copyright}}%
  \let\@evenfoot\@oddfoot
}

\AtBeginDocument{\@ifundefined{doc@stage}{\def\doc@stage{0}}{}}
\let\rtitleheadline@size\scriptsize
\let\rtitleheadline@pagesize\footnotesize
\def\rtitleheadline{\rtitleheadline@size\@journal\ \ifnum\doc@stage<300\relax 00 (20xx)\else
  \@volume\ (\@pubyearfrom@fmt\the\@pubyear)\fi\ \@pagerange
\hfill{\rtitleheadline@pagesize\thepage}\break
\@ifundefined{@doi}{}{DOI \@doi\\}%
\@publisher}
\let\ltitleheadline\rtitleheadline

\def\@copyright{%
  \if@open@access\mbox{\rlap{\raisebox{-1.5\baselineskip}[\z@][\z@]{\vtop{%
  \fontsize{7.9}\baselineskip\selectfont%
  \ifnum\jobstart@date@info>20160706\relax
    This article is published online with Open Access and distributed under
    the terms of the Creative Commons Attribution Non-Commercial Li%
    \ifnum\ios@journal@layout=\thr@@
    \else
      \char\hyphenchar\font\break
    \fi
    cense (CC BY-NC 4.0).%
  \else
    This article is published online with Open Access and distributed under 
    the terms of the Creative Commons Attribution Non-Commercial License.%
  \fi
  }}}}\fi%
  \@issn/\the@copyearfrom\the@copyear/\$\@price\ \copyright@sign\
  \@pubyearfrom@fmt\the\@pubyear\@copyrightowner}%

% ************************ FOOTNOTE
% footnoterule
\def\footnoterule{\kern-3\p@
  \hrule width\footnoterule@width
  \kern 2.6\p@}

\newcommand\@makefntext[1]{%
    \parindent1em\@makefnmark #1}
\def\@makefnmark{\@textsuperscript{\normalfont\@thefnmark}}%

\def\freefootnotetext[#1]{%
       \begingroup\unrestored@protected@xdef\@thefnmark{#1}\endgroup\@footnotetext}

% ************************ Counters
\setcounter{secnumdepth}{3}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

% ******************** Sectioning commands
% sections style
\def\section@style{\normalsize\bfseries\nohyphen\raggedright}
\def\subsection@style{\normalsize\itshape\nohyphen\raggedright}
\def\subsubsection@style{\normalsize\itshape\nohyphen\raggedright}
\def\paragraph@style{\normalsize\itshape}
\def\subparagraph@style{\normalsize\itshape}
% sections beforeskip
\def\section@beforeskip{\bigskipamount}
\def\subsection@beforeskip{\medskipamount}
\def\subsubsection@beforeskip{\smallskipamount}
\def\paragraph@beforeskip{\smallskipamount}
\def\subparagraph@beforeskip{0.1pt}
% sections afterskip
\def\section@afterskip{\medskipamount}
\def\subsection@afterskip{\medskipamount}
\def\subsubsection@afterskip{0.1pt}
\def\paragraph@afterskip{-1em}
\def\subparagraph@afterskip{-1em}
% sections indent
\let\subsection@indent\z@
\let\subparagraph@indent\z@

\def\nohyphen{\pretolerance=10000 \tolerance=10000
\hyphenpenalty=10000 \exhyphenpenalty=10000}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {\section@beforeskip}%
                                   {\section@afterskip}%
                                   {\section@style}}
\newcommand\subsection{\@startsection {subsection}{2}{\subsection@indent}%
                                   {\subsection@beforeskip}%
                                   {\subsection@afterskip}%
                                   {\subsection@style}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {\subsubsection@beforeskip}%
                                     {\subsubsection@afterskip}%
                                     {\subsubsection@style}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {\paragraph@beforeskip}%
                                    {\paragraph@afterskip}%
                                    {\paragraph@style}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\subparagraph@indent}%
                                       {\subparagraph@beforeskip}%
                                       {\subparagraph@afterskip}%
                                       {\subparagraph@style}}
% Format for the counter:
\def\@seccntformat#1{\csname the#1\endcsname.\enspace}

\let\app@sv@section\section

\def\@appsectionstar#1{%
  \if@seceqn\refstepcounter{section}\fi%
  \ifx&#1&%
    \app@sv@section*{Appendix}%
  \else
    \app@sv@section*{Appendix.\enspace #1}%
  \fi
}
\def\@appsectionnostar#1{%
  \refstepcounter{section}%
  \ifx&#1&%
    \app@sv@section*{Appendix \thesection}%
  \else
    \app@sv@section*{Appendix \thesection.\enspace #1}%
  \fi
}

\def\appendix{%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \def\thesection{\Alph{section}}%
  \def\theHsection{\Alph{section}}%
  \def\section{\@ifstar\@appsectionstar\@appsectionnostar}%
}

\def\acknowledgementsname{Acknowledgements}
\def\acknowledgements@error{\ClassError{iosart2x}{\string\ack(s) must be encoded as environment (for XML)}\@ehc}
\let\acknowledgements@closed\relax
\def\acknowledgements{\global\let\acknowledgements@closed\acknowledgements@error\section*{\acknowledgementsname}}
\def\endacknowledgements{\global\let\acknowledgements@closed\relax}
\let\endack\endacknowledgements
\let\endacks\endacknowledgements
\AtEndDocument{\acknowledgements@closed}
\let\acks\acknowledgements
\def\ack{\def\acknowledgementsname{Acknowledgement}\acknowledgements}
% ack(s) (some differences for JCS)
\expandafter\ifstrequal\expandafter{\@JID}{JCS}{%
  \gdef\acknowledgementsname{Acknowledgments}%
  \gdef\ack{\def\acknowledgementsname{Acknowledgment}\acknowledgements}%
}{}

%****************** LISTS
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.4em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

\def\setenumlabel#1{\gdef\max@enumlabel{#1}}
\setenumlabel{1.}

\def\enumerate{\@ifnextchar[{\enumerate@}{\enumerate@[\max@enumlabel]}}

\def\enumerate@[#1]{\ifnum \@enumdepth >4 \@toodeep\else
 \advance\@enumdepth \@ne
 \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
 \list {\csname label\@enumctr\endcsname}%
 {\usecounter{\@enumctr}\def\makelabel##1{{\hfill\rm ##1}}
\settowidth{\labelwidth}{#1}
\advance\labelwidth by\parindent \labelsep=0.5em
 \leftmargin\z@ \rightmargin\z@ \itemindent=\labelwidth
        \advance\itemindent\labelsep
        \leftmargin=\the\itemindent\itemindent=\z@
        \partopsep\z@ \topsep\smallskipamount \parsep\z@ \itemsep\z@ %\@rightskip\z@ plus 1fil
 \listparindent\z@}\fi\setenumlabel{1.}}

\RequirePackage{keyval}
%%%%%%%%%%%%%%%%%%%%%% ITEMIZE
\newcommand\labelitemi{\normalfont\bfseries \textendash}
\newcommand\labelitemii{\textasteriskcentered}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\let\@itemize@indent\parindent

\def\itemize{\@ifnextchar[{\itemize@}{\itemize@[]}}
\def\itemize@[#1]{\ifnum \@itemdepth >4 \@toodeep\else
  \advance\@itemdepth \@ne
  \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
  \if.#1. \else\def\@@tempa{#1}\edef\@itemitem{@@tempa}\fi\list
{\csname\@itemitem\endcsname}{\settowidth{\labelwidth}
                {\csname\@itemitem\endcsname}
                \def\makelabel##1{##1}\labelsep=0.5em%ST
        \itemindent=\labelwidth \advance\itemindent\labelsep
                \advance\itemindent\@itemize@indent
        \leftmargin\the\itemindent \itemindent=\z@
                \partopsep\z@ \topsep\smallskipamount \parsep\z@ %\@rightskip\z@ plus 1fil
        \itemsep\z@ \listparindent\z@} \fi}

\newenvironment{description}%
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}

\newenvironment{quotation}
               {\ifhmode\endgraf\fi\list{}{\small\listparindent2mm%
                        \itemindent\z@   %
                        \rightmargin\z@   \leftmargin\parindent%
                        \partopsep\z@ \topsep\smallskipamount \parsep\z@%
                        }%
                \item[\Q@strut]\relax}
               {\endlist}
\def\Q@strut{\leavevmode\hbox{\vrule height9pt depth1pt width0pt}}

\newenvironment{quote}
               {\list{}{\listparindent\z@%
                        \itemindent    \listparindent%
                        \rightmargin\z@   \leftmargin 1.5em%
                        \partopsep\z@ \topsep6pt \parsep\z@%
                        }%
                \item[\Q@strut]\relax}
               {\endlist}

\def\abbrsection#1{%
  \edef\subsection@indent{-\leftmargin}%
  \subsection*{#1}%
}
\define@key{abbrgroup}{title}{\def\ios@abbrgroup@title{#1}}
\define@key{abbrgroup}{notitle}[true]{\edef\ios@abbrgroup@notitle{1}}
\def\abbrgroup@labelwidth{0pt}
\newenvironment{abbrgroup}[1][title={Abbreviations}]{%
  \setkeys{abbrgroup}{#1}%
  \def\abbrgroup@@labelwidth{0pt}%
  \@ifundefined{ios@abbrgroup@notitle}{\section*{\ios@abbrgroup@title}}{}%
  \list{}{\labelwidth\abbrgroup@labelwidth 
    \labelsep=1em%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \let\makelabel\abbrgrouplabel}%
}{%
  \protected@write\@auxout{}{\string\gdef\string\abbrgroup@labelwidth{\abbrgroup@@labelwidth}}%
  \endlist
}
\newcommand*\abbrgrouplabel[1]{\normalfont
  \settowidth\@tempdima{#1}%
  \ifdim\@tempdima>\abbrgroup@@labelwidth
    \xdef\abbrgroup@@labelwidth{\the\@tempdima}%
  \fi
#1%
}

% list labels corrections
\ifnum\ios@journal@layout>\z@
\renewcommand\labelitemi{\normalfont$\bullet$}
\renewcommand\labelenumi{(\theenumi)}
\fi

\csuse{\fmt@name @load@stabular}

%************************** TABULAR
\let\savehline\hline
   \def\thline{\noalign{\vskip3pt}\savehline\noalign{\vskip3pt}}%
   \def\fhline{\noalign{\vskip1pt}\savehline\noalign{\vskip7pt}}%
   \def\bhline{\noalign{\vskip3pt}\noalign{\global\arrayrulewidth=1\p@}\savehline\noalign{\global\arrayrulewidth=.5\p@}\noalign{\vskip3pt}}%
   \def\lhline{\noalign{\vskip3pt}\noalign{\global\arrayrulewidth=.3\p@}\savehline\noalign{\global\arrayrulewidth=.5\p@}\noalign{\vskip3pt}}

%************************** MATH SETTINGS
\setlength\mathindent{2em}
\setlength\arraycolsep{1.2\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\setlength\jot{6\p@}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\if@seceqn
  \@addtoreset {equation}{section}
  \renewcommand\theequation{\thesection.\@arabic\c@equation}
\else
  \renewcommand\theequation{\@arabic\c@equation}
\fi

\ifnum\ios@journal@layout>\z@
\csuse{\fmt@name @load@vsfleqn2}
\fi

\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\if@reducehelvetica
\RequirePackage[scaled=.9]{helvet}
\else
\RequirePackage{helvet}
\fi
\csuse{\fmt@name @load@textcomp}
\normalfont

\csuse{\fmt@name @load@mathtime}

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\allowdisplaybreaks

\csuse{\fmt@name @load@alt@mathtime}

\ifnum\ios@journal@layout>\z@

% different from mathtime settings only
\DeclareMathSizes{9}{9}{7}{6}
\DeclareMathSizes{11}{11}{7.6}{6}
\DeclareMathSizes{12}{12}{8}{7}
\DeclareMathSizes{14}{14}{10}{8}
\DeclareMathSizes{16}{16}{12}{9}
\DeclareMathSizes{17}{17}{12}{9}
\DeclareMathSizes{20}{20}{14}{10}
\DeclareMathSizes{24}{24}{16}{12}
\DeclareMathSizes{25}{25}{16}{12}
%
\csuse{\fmt@name @load@vtexsavepos}
\csuse{\fmt@name @last@display}
\fi

\def\amsarraycolsep{\arraycolsep=5\p@}
% command for changing arraycolsep:
\def\setamsmatrix{
  \let\sv@matrix\matrix\def\matrix{\amsarraycolsep\sv@matrix} 
  \let\sv@pmatrix\pmatrix\def\pmatrix{\amsarraycolsep\sv@pmatrix} 
  \let\sv@bmatrix\bmatrix\def\bmatrix{\amsarraycolsep\sv@bmatrix} 
  \let\sv@Bmatrix\Bmatrix\def\Bmatrix{\amsarraycolsep\sv@Bmatrix} 
  \let\sv@vmatrix\vmatrix\def\vmatrix{\amsarraycolsep\sv@vmatrix} 
  \let\sv@Vmatrix\Vmatrix\def\Vmatrix{\amsarraycolsep\sv@Vmatrix} 
}
\setamsmatrix

\ifnum\ios@journal@layout>\z@
\csuse{\fmt@name @load@timesxi}
\fi

\csuse{\fmt@name @vtex@gr@packages}

% Last page control
\csuse{\fmt@name @load@vkt@cmn@lp}

%************************** THEOREMS

\ifnum\ios@journal@layout>\z@

\def\mathend@qed{\hbox to\hsize{%
  \@ifversionge{102}{%
    \hfill$\Box$%
  }{%
    \@@vtexpos\ios@last@display@id
    \edef\mathend@ypos@id{ioslastdisplay-\pagepos-ypos-\ypos}%
    \@@vtexpos\mathend@ypos@id
    \hskip\xpos\quad$\Box$%
  }%
}}
\def\upqed{\vskip-\belowdisplayskip\vskip-\baselineskip\kern0pt\let\qed\mathend@qed}
\def\qed{% unified with ios2a
  \ifmmode\hskip2em\Box
  \else
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\quad $\Box$%
  \fi
}
\def\noqed{\let\sv@qed\qed\def\qed{\global\let\qed\sv@qed}}

\def\@proof@label@sep{.\kern\p@}

\def\proof@topsep{9\p@\@plus3\p@}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep\proof@topsep\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@proof@label@sep]\ignorespaces
}{%
  \popQED\endtrivlist\@endpetrue
}

\@ifversionge{111}
  {\newtheoremstyle{plain}{\medskipamount}{\medskipamount}{\normalfont\itshape}{}%
     {\normalfont\bfseries}{.}{.5em}{}}
  {\newtheoremstyle{plain}{\medskipamount}{\medskipamount}{\normalfont\xishape}{}%
     {\normalfont\bfseries}{.}{.5em}{}}

\newtheoremstyle{remark}{\medskipamount}{\medskipamount}{\normalfont\upshape}{}%
  {\normalfont\bfseries}{.}{.5em}{}
\g@addto@macro\@endtheorem{\@endpetrue}
\g@addto@macro\endproof{\@endpetrue}

\fi

\@ifversionge{104}{\g@addto@macro\@endtheorem{\@endpefalse}%
                   \g@addto@macro\endproof{\@endpefalse}}{}%

%
%******* TABLES, FIGURES, ALGORITHM
\newcounter{figure}
\if@secfloat
 \@addtoreset{figure}{section}
 \renewcommand \thefigure {\thesection.\@arabic\c@figure}
\else
 \renewcommand \thefigure {\@arabic\c@figure}
\fi

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure.}

\newenvironment{figure}
               {\let\@makecaption\@makefigurecaption\let\@floatboxreset\@figureboxreset\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\let\@makecaption\@makefigurecaption\let\@floatboxreset\@figureboxreset\@dblfloat{figure}}
               {\end@dblfloat}

\def\@figureboxreset{%
        \reset@font%
        \centering%
        \@setnobreak%
        \@setminipage%
}

\newcounter{listing}
\def\listingname{Listing}
\renewcommand \thelisting {\@arabic\c@listing}
\def\fps@listing{tbp}
\def\ftype@listing{5}
\def\ext@listing{lol}
\def\fnum@listing{\listingname~\thelisting.}
\newenvironment{listing}
               {\let\@makecaption\@makefigurecaption\let\@floatboxreset\@figureboxreset\@float{listing}}
               {\end@float}
\newenvironment{listing*}
               {\let\@makecaption\@makefigurecaption\let\@floatboxreset\@figureboxreset\@dblfloat{listing}}
               {\end@dblfloat}


\long\def\@makefigurecaption#1#2{\footnotesize%
 \vskip\abovecaptionskip
\setbox\@tempboxa\hbox{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    \unhbox\@tempboxa\par
  \else
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi}

% TABLE
\newcounter{table}
\if@secfloat
  \@addtoreset{table}{section}
\renewcommand \thetable{\thesection.\@arabic\c@table}
\else
  \renewcommand \thetable{\@arabic\c@table}
\fi
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\let\tablebr\break

\newenvironment{table}
               {\let\@makecaption\@maketablecaption%
               \let\@floatboxreset\@tableboxreset\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\let\@makecaption\@maketablecaption%
               \let\@floatboxreset\@tableboxreset\@dblfloat{table}}
               {\end@dblfloat}

\def\@tableboxreset{%
        \reset@font%
        \centering\footnotesize%
        \def\arraystretch{1.2}
        \@setnobreak%
        \@setminipage%
}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{8\p@}
\setlength\belowcaptionskip{3\p@}

\newdimen\tablewidth \tablewidth\textwidth
\newdimen\saved@tablewidth \saved@tablewidth\textwidth

\long\def\@maketablecaption#1#2{\begingroup\footnotesize
 \global\setbox\@tempboxa\hbox{#2}\endgroup\centering
 \hbox to \hsize{\footnotesize\hss#1\hss}\par
 \ifdim \wd\@tempboxa>\tablewidth \parbox[t]{\tablewidth}{\footnotesize%
 \mbox{}#2\vphantom{Ay}\par} \else
 \hbox to\hsize{\hfill\box\@tempboxa\vphantom{Ay}\hfill}\fi%
 \global\saved@tablewidth\tablewidth%
 \global\tablewidth\hsize\vskip\belowcaptionskip}

\csuse{\fmt@name @load@tabnotes}

% rotating
\if@rotating@loaded

\newenvironment{local@sidewaysfigure}
               {\let\@makecaption\@makefigurecaption
                \let\@floatboxreset\@figureboxreset
                \@rotfloat{figure}}
               {\end@rotfloat}

\newenvironment{local@sidewaysfigure@star}
               {\let\@makecaption\@makefigurecaption
                \let\@floatboxreset\@figureboxreset
                \@rotdblfloat{figure}}
               {\end@rotdblfloat}

\newenvironment{local@sidewaystable}
               {\let\@makecaption\@maketablecaption
                \let\@floatboxreset\@tableboxreset
               \@rotfloat{table}}
               {\end@rotfloat}

\newenvironment{local@sidewaystable@star}
               {\let\@makecaption\@maketablecaption
                \let\@floatboxreset\@tableboxreset
               \@rotdblfloat{table}}
               {\end@rotdblfloat}

\AtEndOfClass{%
  \def\sidewaysfigure{\local@sidewaysfigure}%
  \def\endsidewaysfigure{\endlocal@sidewaysfigure}%
  \@namedef{sidewaysfigure*}{\local@sidewaysfigure@star}%
  \@namedef{endsidewaysfigure*}{\endlocal@sidewaysfigure@star}%
  \def\sidewaystable{\local@sidewaystable}%
  \def\endsidewaystable{\endlocal@sidewaystable}%
  \@namedef{sidewaystable*}{\local@sidewaystable@star}%
  \@namedef{endsidewaystable*}{\endlocal@sidewaystable@star}%
}
\fi

\@ifversionge{110}{}{%
%%****************** Algorithm
\newcounter{algorithm}
\if@secfloat
  \@addtoreset{algorithm}{section}
\renewcommand \thealgorithm{\thesection.\@arabic\c@algorithm}
\else
  \renewcommand \thealgorithm{\@arabic\c@algorithm}
\fi
\def\fps@algorithm{tbp}
\def\ftype@algorithm{4}
\def\ext@algorithm{loa}
\def\fnum@algorithm{\algorithmname~\thealgorithm.}

\let\algo@pre@rule\relax
\let\algo@post@rule\relax
\let\algo@cap@rule\relax

\newenvironment{algorithm}
               {\let\@makecaption\@makealgorithmcaption%
               \let\@floatboxreset\@algorithmboxreset\@float{algorithm}}
               {\algo@post@rule \end@float}
\newenvironment{algorithm*}
               {\let\@makecaption\@makealgorithmcaption%
               \let\@floatboxreset\@algorithmboxreset\@dblfloat{algorithm}}
               {\algo@post@rule \end@dblfloat}

\let\algo@box@reset@centering\centering
\def\@algorithmboxreset{%
        \reset@font%
        \algo@box@reset@centering
        \@setnobreak%
        \@setminipage%
}
%
\ifnum\ios@journal@layout=\z@
\let\algo@box@reset@centering\relax
\fi

\def\algo@caption@size{\small}
\long\def\@makealgorithmcaption#1#2{\vskip2ex\algo@caption@size
  \algo@pre@rule
  \hbox to \hsize{\parbox[t]{\hsize}{{\bf #1} #2}}%
  \algo@post@rule
}

%%%% Program Code:
\def\programcode{%
\let\@makealgorithmcaption\@makefigurecaption
\def\algorithmname{Program Code}}

\ifnum\ios@journal@layout>\z@
  \def\algo@cap@rule{\kern2\p@\hrule\@height.8\p@\@depth\z@}
  \def\algo@pre@rule{\hrule\@height.8\p@\@depth\z@\kern2\p@}
  \def\algo@post@rule{\kern2\p@\hrule\@height.8\p@\@depth\z@\kern2\p@}
  \g@addto@macro\doc@stage@hook{%
    \@ifpackageloaded{algorithm2e}{%
      \renewcommand{\algocf@capseparator}{.}%
      \RestyleAlgo{ruled}%
    }{}
    \@ifpackageloaded{algorithm}{%
      \def\fnum@algorithm{\fname@algorithm~\thealgorithm.}%
    }{}
  }
\else
\@ifversionge{103}{%
  \def\fnum@algorithm{\algorithmname~\thealgorithm}
  \def\algo@cap@rule{\kern2\p@\hrule\@height.8\p@\@depth\z@}
  \def\algo@pre@rule{\hrule\@height.8\p@\@depth\z@\kern2\p@}
  \def\algo@post@rule{\kern2\p@\hrule\@height.8\p@\@depth\z@\kern2\p@}
  \def\algo@caption@size{}
}{}
\fi
}%v1.1.0 end

%********************* COMPATIBILITY WITH OLD LATEX:
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\let\sl\it
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\if@secthm
 \@addtoreset{thm}{section}
 \def\thethm{\thesection.\arabic{thm}}
\else
 \def\thethm{\arabic{thm}}
\fi

%***************************** BIBLIOGRAPHY

\def\biblio@clubpenalty{4000}
\def\biblio@widowpenalty{4000}
\newenvironment{thebibliography}[1]
     {\section*{\refname}\footnotesize\rmfamily\upshape%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty\biblio@clubpenalty
      \@clubpenalty \clubpenalty
      \widowpenalty\biblio@widowpenalty%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\ClassWarning{iosart2x}{Empty `thebibliography' environment}}%
      \endlist}

\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}

\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\hskip.1pt}%
     \edef\@citeb{\expandafter\@firstofone\@citeb}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \ClassWarning{iosart2x}{Citation `\@citeb' on page \thepage \space undefined}}%
       {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}

\if@nameyear
\csuse{\fmt@name @natbib@authoryear}
\else
\csuse{\fmt@name @natbib@numbers}
\fi% end numbers

\let\bibfont\footnotesize

\let\endbibitem\relax
%\def\hybrsp{ }

%
\RequirePackage{color}

\csuse{\fmt@name @qtags@and@etc}

\csuse{\fmt@name @vtex@ltxext}

\def\getattribute#1#2{\csname #1@#2\endcsname}
\def\sep@key@value#1=#2/?/#3{\setpkgattr{#3}{#1}{#2}}
\def\do@option@list#1#2{%
  \@for\curr@option:={#2}\do{%
    \expandafter\sep@key@value\curr@option/?/{#1}\relax
  }%
}

\usepackage{url}
\csuse{\fmt@name @vtex@url}
\urlstyle{rm} 

\@ifundefined{tagbib@style}{\def\tagbib@style{}}{}% IOS 1

\csuse{\fmt@name @bibl@settings}

%****************************** HISTORY *

% history month - full name
\def\setvaluelist#1#2{\@tempcnta=0\relax
  \@for\@curr@val:=#2\do{%
     \advance\@tempcnta by1\relax
     \expandafter\protected@xdef\csname #1@item@\the\@tempcnta\endcsname{\@curr@val}%
     }%
     \expandafter\protected@xdef\csname #1@item@0\endcsname{\the\@tempcnta}%
}
\xdef\getitemvalue#1#2{\noexpand\csname #1@item@#2\endcsname}
\def\sday#1{#1}\def\syear#1{#1}
\def\smonth#1{\@ifundefined{month@item@#1}%
  {\ClassError{iosart2x}{There is no month with number '#1'!}\@ehc}%
  {\getitemvalue{month}{#1}}%
}%
\setvaluelist{month}{January,February,March,April,May,June,July,August,September,October,November,December}
\expandafter\def\csname month@item@0\endcsname{????}


\newif\if@history \@historyfalse
\newskip\b@history@skip \b@history@skip=12pt
%
% Received, accepted etc.
%
\def\received#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@received{#1}\global\@historytrue\fi}
  \def\@received{\@nil}
\def\revised#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@revised{#1}\fi}
  \def\@revised{\@nil}
\def\accepted#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@accepted{#1}\global\@historytrue\fi}
  \def\@accepted{\@nil}
\def\communicated#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@communicated{#1}\global\@historytrue\fi}
  \def\@communicated{\@nil}
\def\dedicated#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@dedicated{#1}\global\@historytrue\fi}
  \def\@dedicated{\@nil}
\def\acceptedby#1{\gdef\@acceptedby{#1}}
%
\def\acceptedby@prefix{Accepted~by:~}
\def\received@prefix{Received~}
\def\revised@prefix{Revised~}
\def\accepted@prefix{Accepted~}
\def\communicated@prefix{Communicated~by~}
\def\dedicated@prefix{\bgroup\vskip\b@history@skip\leavevmode\normalsize\itshape}
\def\history@prefix{}
%
\def\acceptedby@postfix{\par}
\def\received@postfix{\par}
\def\revised@postfix{\par}
\def\accepted@postfix{\par}
\def\communicated@postfix{\par}
\def\dedicated@postfix{\par\egroup}
\def\history@postfix{}

\def\empty@data{\@nil}
%
\def\history@fmt{%
  \bgroup\footnotesize\baselineskip12pt
  \vskip\b@history@skip
  \history@prefix\leavevmode
    \ifx\@received\empty@data \else        
    \received@prefix\@received \received@postfix\fi%
    \ifx\@revised\empty@data \else
      \revised@prefix\@revised \revised@postfix%
    \fi
    \ifx\@accepted\empty@data \else
      \accepted@prefix\@accepted \accepted@postfix%
    \fi
    \ifx\@communicated\empty@data \else
      \communicated@prefix\@communicated \communicated@postfix%
    \fi
    \history@postfix
  \ifx\@dedicated\empty@data \else
      \dedicated@prefix \@dedicated \dedicated@postfix%
  \fi
  \par \egroup}

%****************************** FRONTMATTER *

\newtoks\t@glob@notes
\newtoks\t@loc@notes
\newcount\note@cnt
\newcounter{author}
\newcount\n@author
\def\n@author@{}
\newcounter{address}

\newdimen\sv@mathsurround
\newcount\sv@hyphenpenalty

\newcount\prev@elem \prev@elem=0
\newcount\cur@elem  \cur@elem=0
\chardef\e@pretitle=1
\chardef\e@title=1
\chardef\e@subtitle=1
\chardef\e@author=2
\chardef\e@address=3

\newif\if@newelem
\newif\if@firstauthor
\newif\if@preface
\newif\if@hasabstract
\newif\if@haskeywords

\newbox\fm@box
\newdimen\fm@size
\newbox\t@abstract
\newbox\t@keywords

\def\add@tok#1#2{\global#1\expandafter{\the#1#2}}
\def\add@xtok#1#2{\begingroup
  \no@harm
  \xdef\@act{\global\noexpand#1{\the#1#2}}\@act
\endgroup}

\def\tailthanksref[#1]#2{\noexpand\pthanksref{#1}}
\def\pthanksref#1{\global\advance\note@cnt\@ne\ifnum\note@cnt>\@ne
\global\t@loc@notes\expandafter{\the\t@loc@notes\note@sep}\fi
\global\t@loc@notes\expandafter{\the\t@loc@notes#1}}

\def\beg@elem{\global\t@loc@notes={}\global\note@cnt\z@}
\def\@xnamedef#1{\expandafter\xdef\csname #1\endcsname}

\def\no@harm{%
  \let\\=\relax  \let\rm\relax
  \let\ss=\relax \let\ae=\relax \let\oe=\relax
  \let\AE=\relax \let\OE=\relax
  \let\o=\relax  \let\O=\relax
  \let\i=\relax  \let\j=\relax
  \let\aa=\relax \let\AA=\relax
  \let\l=\relax  \let\L=\relax
  \let\d=\relax  \let\b=\relax \let\c=\relax
  \let\bar=\relax
  \def\qq@group@start{}\def\qq@group@end{}\let\qq@cmd\@firstofone\def\qq@style{}%
  \def\protect{\noexpand\protect\noexpand}}

\def\proc@elem#1#2{\begingroup
    \no@harm
    \def\thanks##1##{\@gobble}%
    \def\thanksref##1##{\@gobble}%
    \@xnamedef{@#1}{#2}%
  \endgroup
  \prev@elem=\cur@elem
  \cur@elem=\csname e@#1\endcsname
  \expandafter\elem@nothanksref#2\thanksref\relax%
  \expandafter\elem@nothanks#2\thanks\relax}

\def\elem@nothanksref#1\thanksref{\futurelet\@peektok\elem@thanksref}
\def\elem@thanksref{\ifx\@peektok\relax
  \else \expandafter\elem@morethanksref \fi}
\def\elem@morethanksref[#1]#2{\add@thanks{#1}\elem@nothanksref}

\def\elem@nothanks#1\thanks{\futurelet\@peektok\elem@thanks}
\def\elem@thanks{\ifx\@peektok\relax
  \else \ifx\@peektok[ \expandafter\expandafter\expandafter\elem@morethankse
  \else \expandafter\expandafter\expandafter\elem@morethanks \fi\fi}

\def\elem@morethankse[#1]#2{\thanks@optarg[#1]{#2}\add@thanks{#1}\elem@nothanks}
\def\elem@morethanks#1{\thanks@optarg[]{#1}\add@thanks{}\elem@nothanks}

\def\add@thanks#1{%
  \global\advance\note@cnt\@ne
    \ifnum\note@cnt>\@ne \add@xtok\t@loc@notes{\note@sep}\fi
    \ifx.#1.%
      \add@xtok\t@loc@notes{\protect\Hy@breaklinkstrue
        \protect\hyper@linkstart{link}{\thefootnote iosthanks}\thefootnote\protect\hyper@linkend}%
    \else
      \add@xtok\t@loc@notes{\protect\Hy@breaklinkstrue
        \protect\hyper@linkstart{link}{#1iosthanks}#1\protect\hyper@linkend}%
    \fi%
}

\def\add@addressref#1{%
  \global\advance\note@cnt\@ne
  \ifnum\note@cnt>\@ne
    \add@xtok\t@loc@notes{\note@sep}%
  \fi
  \add@tok\t@loc@notes{\ref{#1}}%
  }
\def\note@sep{,}

\def\thanks@optarg[#1]#2{%
  \ifx.#1.%
    \add@tok\t@glob@notes{\footnotetext}%
  \else
    \add@tok\t@glob@notes{\freefootnotetext}%
  \fi%
  \ifx.#1.%
    \refstepcounter{footnote}%
    \add@xtok\t@glob@notes{[\the\c@footnote]}%
  \else
    \add@xtok\t@glob@notes{[#1]}%
  \fi%
  \ifx.#1.%
    \edef\my@hy@tmp{\noexpand\hypertarget{\thefootnote iosthanks}{}}%
  \else
    \edef\my@hy@tmp{\noexpand\hypertarget{#1iosthanks}{}}%
  \fi
  \expandafter\add@tok\expandafter\t@glob@notes\expandafter{\expandafter{\my@hy@tmp #2}}%
  \ignorespaces
  }%

\def\fm@textsuperscript#1{\textsuperscript{\upshape #1}}
\ifnum\ios@journal@layout>\z@
  \def\fm@textsuperscript#1{\hbox{$^{\mathrm{\scriptsize #1}}$}}
\fi

% FRONTMATTER

\newdimen\a@title@skip \a@title@skip=12\p@
\newskip\b@section@skip \b@section@skip=36\p@ plus6\p@ minus6\p@%
\newskip\b@pretitle@skip \b@pretitle@skip12\p@

\def\frontmatter{%
  %
  \def\pdftitle##1{\write@pdfinfo{\user@hy@title}{##1}}%
  \def\pdfauthor##1{\write@pdfinfo{\user@hy@author}{##1}}%
  \def\pdfsubject##1{\write@pdfinfo{\user@hy@subject}{##1}}%
  \def\pdfkeywords##1{\write@pdfinfo{\user@hy@keywords}{##1}}%
  %\let\review\ios@review
  \def\dead{\hbox{$\dagger$}}%
  \let\@corresp@note\relax
  \global\t@glob@notes={}\global\c@author\z@
  \global\c@address\z@
  \sv@mathsurround\mathsurround \m@th
  \global\n@author=0\n@author@\relax
  \global\advance\n@author\m@ne
  \global\@firstauthortrue
  \global\@hasabstractfalse
  \global\@prefacefalse
  \newcount\c@sv@footnote
  \global\c@sv@footnote=\c@footnote
  \parindent\z@
  \open@fm \ignorespaces}

\def\preface{\@prefacetrue}

% ENDFRONTMATTER

\def\endfrontmatter{%
  \global\c@footnote=\c@sv@footnote
  \global\n@author=\c@author \@writecount
  \csname form@runauthors\endcsname
  \@if@vtex@in@house{%
    \@ifundefined{pretitle@used}{\dbl@error{Command \string\pretitle[XML]{...} must be used}}{}%
  }{}%
  \global\@topnum\z@
  \ifx\@firstpage\@lastpage
    \gdef\@pagerange{\special@supplement@letter\@firstpage}
  \else
    \gdef\@pagerange{\special@supplement@letter\@firstpage--\special@supplement@letter\@lastpage}
  \fi
  \thispagestyle{copyright}%
  \if@preface \else\if@history \history@fmt\fi\fi
  \newcount\c@sv@footnote
  \global\c@sv@footnote=\c@footnote
  \if@twocolumn\else\output@glob@notes\fi
  % \output@glob@notes
  \if@preface
    \@hasabstractfalse
  \fi
  \if@hasabstract
    \normal@text
    \vskip\abstract@skip
    \unvbox\t@abstract
  \fi
  \if@haskeywords
    \if@hasabstract
      \vskip\keywords@skip
    \else
      \vskip\keywords@noabs@skip
    \fi
    \unvbox\t@keywords
  \fi
  \@ifundefined{@acceptedby}{}{%
    \ifnum\prevdepth>\z@
      \vskip-\prevdepth
    \fi
    \vskip\keywords@skip
    \bgroup
      \abstract@size
      \acceptedby@prefix\@acceptedby\acceptedby@postfix
    \egroup
  }%
  \@ifundefined{has@notes}{}{%
    \vskip\notes@skip
    \unvbox\notes@box
    \notes@end@hook
  }%
  \@tempcnta\z@
  \@whilenum\@tempcnta<\c@author\do{%
    \advance\@tempcnta\@ne
    \ifnum\@tempcnta>\@ne\addto@authors@list{, }\fi%
    \addto@authors@list{\@nameuse{\short@journal @fnmsmd@\the\@tempcnta @author}\@ifundefined{\short@journal @fnmsmd@\the\@tempcnta @author}{}{ }\@nameuse{\short@journal @snm@\the\@tempcnta @author}}%
  }%
  %
  \write@pdfinfo{\hy@author}{\the\authors@list}%
  \write@pdfinfo{\hy@subject}{\@journal, \@pubyearfrom@fmt\the\@pubyear, \@volume, \@issue, \@pagerange}
  \write@pdfinfo{\hy@keywords}{\the\keywords@list}%
  %
  \close@fm
  \if@twocolumn\output@glob@notes\fi
  \markboth{\@runauthor\@runtitle}{\@runauthor\@runtitle}%
  \global\@prefacefalse
  \global\leftskip\z@
  \global\@rightskip\z@
  \global\rightskip\@rightskip
  \global\c@footnote=\c@sv@footnote
  \global\mathsurround\sv@mathsurround
  \let\title\relax       \let\author\relax
  \let\address\relax
  \let\frontmatter\relax \let\endfrontmatter\relax
  \let\@maketitle\relax  \let\@@maketitle\relax
  \normal@text}
%
% Twocolumn journal has full page width commands
% \pretitle, \title and \subtitle only. So we're using
% \maketitle, which closes box

  \def\two@c@maketitle{%
    \global\let\close@fm\relax%
    \vskip\b@section@skip%
    \par \egroup
    \emergencystretch=1pc \twocolumn[\unvbox\fm@box]}

\if@restonecol
  \let\maketitle\relax
\else
  \ifnum\ios@journal@layout>\z@
    \let\maketitle\@empty
  \else
    \let\maketitle\two@c@maketitle
  \fi
\fi

\newdimen\t@xtheight
\def\init@settings{
\splittopskip=\topskip \splitmaxdepth=\maxdepth
\t@xtheight\textheight \advance\t@xtheight-\splittopskip}

\def\open@fm{
  \global\setbox\fm@box=\vbox\bgroup
  \hsize=\textwidth
  \raggedright
  \sv@hyphenpenalty\hyphenpenalty
  \hyphenpenalty\@M}

\def\close@fm{%
  \vskip\b@section@skip%
  \par \egroup
  \fm@size=\dp\fm@box \advance\fm@size by \ht\fm@box
  \@whiledim\fm@size>\t@xtheight \do{%
    \global\setbox\@tempboxa=\vsplit\fm@box to \t@xtheight
    \unvbox\@tempboxa \newpage
    \fm@size=\dp\fm@box \advance\fm@size by \ht\fm@box}
  \if@twocolumn
    \emergencystretch=1pc \twocolumn[\unvbox\fm@box]
  \else
    \unvbox\fm@box
  \fi}

\def\output@glob@notes{\bgroup
  \the\t@glob@notes
  \egroup}

\def\justify@off{\let\\=\@normalcr
  \leftskip\z@ \@rightskip\@flushglue \rightskip\@rightskip}
\def\justify@on{\let\\=\@normalcr
  \leftskip\z@ \@rightskip\z@ \rightskip\@rightskip}

\def\normal@text{\global\let\\=\@normalcr
  \global\leftskip\z@ \global\@rightskip\z@ \global\rightskip\@rightskip
  \global\parfillskip\@flushglue}

\def\@writecount{\write\@mainaux{\string\global
  \string\@namedef{n@author@}{\the\n@author}}%
}

% TITLE
\def\@pretitle@output#1{#1}
\def\@pretitle@hrule{\hrule}
\def\@pretitle@md{}
\def\@pretitle{???}
\long\def\pretitle@key@@#1#2{%
  \xdef\@pretitle{#1}%
#2}%
\long\def\pretitle@key@XML@#1#2{%
  \xdef\@pretitle{#1}%
  \ignorespaces%
}
\setpkgattr{pretitle}{sep}{. }
\newcommand\pretitle[2][]{%
  \xdef\pretitle@used{1}%
  \@ifundefined{pretitle@key@#1@}{\ClassError{iosart2x}{unknown pretitle option key '#1'}\@ehc}{}%
  \@nameuse{pretitle@key@#1@}{#2}{%
  \mdforvkt{main-article-info}{title}{#2}%
  \gdef\@pretitle@md{#2\pretitle@sep}%
  \vspace*{\b@pretitle@skip}\pretitle@size \@pretitle@output{#2}\par
  \vskip6\p@\@pretitle@hrule
  \vskip12\p@}}

\def\title#1{%
  \bgroup
    \no@md@harm
    \xdef\@argi{#1}%
  \egroup
  \write@pdfinfo{\hy@title}{\@argi}%
  \mdforvkt{main-article-info}{title}{\@pretitle@md #1}%
  \beg@elem
  \title@note@fmt
  \add@tok\t@glob@notes
    {\title@note@fmt}%
  \proc@elem{title}{#1}%
  \def\title@notes{\the\t@loc@notes}%
  \title@fmt{\@title}{\title@notes}%
  \global\c@sv@footnote=\c@footnote
  \setcounter{footnote}{0}%
  \ignorespaces}

\newdimen\@@topskip \@@topskip=24\p@

\def\title@textsuperscript#1{\@textsuperscript{\normalfont#1}}
\def\titlenote@size{\fontsize{20}{20}\selectfont}

\ifnum\ios@journal@layout>\z@
\def\title@textsuperscript#1{\hbox{$^{#1}$}}
\let\titlenote@size\relax
\fi

\def\title@fmt#1#2{%
  \vspace*{\@@topskip}
  {\title@size #1\hbox{\titlenote@size\title@textsuperscript{#2}}\par}%
  \vskip\a@title@skip%
  }

\def\subtitle#1{%
  \beg@elem
  \proc@elem{subtitle}{#1}%
  \def\title@notes{\the\t@loc@notes}%
  \subtitle@fmt{\@subtitle}{\title@notes}%
  \ignorespaces}

\def\subtitle@fmt#1#2{%
  {\subtitle@size #1\,\hbox{$^{\mathrm{#2}}$}\par}%
  \vskip\a@title@skip%
  }


\def\title@note@fmt{\def\thefootnote{\arabic{footnote}}}

% \ios@review#1#2#3

\def\oldreview#1#2#3{{%
  \footnotesize\textnormal
  \noindent
  \ifx.#1.\else\textbf{Editor(s):} #1\\\fi
  \ifx.#2.\else\textbf{Solicited review(s):} #2\\\fi
  \ifx.#3.\else\textbf{Open review(s):} #3\fi
  \par
  \vskip\a@title@skip%
}}

\newcounter{review}
\newcounter{reviewauthor}
\@namedef{review@open@settings}{\xdef\reviewertype{reviewer}\xdef\reviewname{Open review(s)}}
\@namedef{review@solicited@settings}{\xdef\reviewertype{reviewer}\xdef\reviewname{Solicited review(s)}}
\@namedef{review@editor@settings}{\xdef\reviewertype{editor}\xdef\reviewname{Editor(s)}}
\def\reviewname{???}
\def\reviewertype{???}
\def\reviewname@fmt#1{\noindent\textbf{#1:}}
\def\review@size{\normalfont\footnotesize}

\def\review@author#1{{%
  \unskip\unkern%
  \ifnum\c@reviewauthor>\z@ ;\fi\
  \stepcounter{reviewauthor}%
  \let\prefix\@firstofone
  \let\fnms\@firstofone
  \let\inits\@firstofone
  \let\snm\@firstofone
  \let\suffix\@firstofone
  \def\address##1{\unskip, ##1}%
  #1}\ignorespaces}%

\newenvironment{review}[1]{%
  \ifnum\c@review>\z@\vskip-\a@title@skip\fi%
  \stepcounter{review}%
  \setcounter{reviewauthor}{0}%
  \let\author\review@author
  \review@size
  \@nameuse{review@#1@settings}%
  \reviewname@fmt{\reviewname}%
}{\par\vskip\a@title@skip}

\csuse{\fmt@name @load@fileinfo}

\@ifundefined{short@journal}{\let\short@journal\@jid}{}

\csuse{\fmt@name @vkt@cmn@fm@add}

% AUTHOR

\newdimen\b@author@skip
\b@author@skip 8\p@

\def\author{\@ifnextchar[{\author@optarg}{\author@optarg[]}}

\def\author@optarg[#1]#2{%
  \stepcounter{author}%
  \beg@elem
  \def\degs##1{##1}%
  \@ifundefined{prefix@\the\c@author @tmp}{\@namedef{prefix@\the\c@author @tmp}{}}{}%
  \def\prefix##1{%
    \protect\protected@write\@auxout{}{\string\global\string\@namedef{prefix@\the\c@author @tmp}{##1 }}%
    ##1}%
  \def\fnms##1{%
    \protect\mdforvkt{main-article-info}{fnm-\the\c@author}{\@nameuse{prefix@\the\c@author @tmp}##1}%
    \cmd@for@aut@elem{fnms}{\the\c@author}{\@nameuse{prefix@\the\c@author @tmp}##1}%
    \cmd@for@aut@elem{fnmsmd}{\the\c@author}{##1}% for PDF metadata only, which don't have prefix
    ##1%
  }%
  \def\inits##1{%
    \protect\mdforvkt{main-article-info}{inits-\the\c@author}{\@nameuse{prefix@\the\c@author @tmp}##1}%
    \cmd@for@aut@elem{inits}{\the\c@author}{\@nameuse{prefix@\the\c@author @tmp}##1}\ignorespaces%
  }%
  \def\snm##1{%
    \protect\protected@write\@auxout{}{\string\global\string\@namedef{snm@\the\c@author @tmp}{##1}}%
    \protect\mdforvkt{main-article-info}{snm-\the\c@author}{##1}%
    \cmd@for@aut@elem{snm}{\the\c@author}{##1}%
    ##1}%
  \@ifundefined{snm@\the\c@author @tmp}{\@namedef{snm@\the\c@author @tmp}{}}{}%
  \def\suffix##1{%
    \protect\mdforvkt{main-article-info}{snm-\the\c@author}{\@nameuse{snm@\the\c@author @tmp}\space ##1}%
    \cmd@for@aut@elem{snm}{\the\c@author}{\@nameuse{snm@\the\c@author @tmp}\space ##1}%
    ##1}%
  \def\roles##1{##1}%
  \def\bio##1{\csxdef{ios@bio@##1@label}{1}%
    \ifnum\stablecompilecount>\z@ 
      \@ifundefined{r@##1}{\ClassError{iosart2x}{unknown biography label '##1'}\@ehc}{}%
    \fi}%
  \if@firstauthor \first@author \global\@firstauthorfalse \fi%
  \@for\@tempa:=#1\do{\expandafter\add@addressref\expandafter{\@tempa}}%
  \let\oldunderscore\_%
  \let\_\textunderscore
  \proc@elem{author}{#2}%
  \let\_\oldunderscore
  \author@fmt{\the\c@author}{\the\t@loc@notes}{\@author}}%

\def\author@fmt#1#2#3{\@newelemtrue
  \ifnum\prev@elem=\e@author \global\@newelemfalse \fi
  \if@newelem \author@fmt@init \fi
  \edef\@tempb{#2}\ifx\@tempb\@empty
    \hbox{#3}\else
    \hbox{#3\,\fm@textsuperscript{#2}}%
  \fi}

\def\first@author{\author@note@fmt%
  \add@tok\t@glob@notes%
    {\author@note@fmt}}%

\def\author@fmt@init{%
  \par
  \vskip \b@author@skip
  \authors@size\raggedright
  \leavevmode}

\def\and{\unskip~and~}

\def\author@note@fmt{%
  \def\thefootnote{\sxarabic{footnote}}}

\def\sxarabic#1{%
  \expandafter\ifcase\value{#1} \or *\or **\or ***\or ****\or *****\fi
  }

\def\syarabic#1{%
  \expandafter\ifcase\value{#1} \or \zstar\or \zstar\zstar\or \zstar\zstar\zstar \or \zstar\zstar\zstar\zstar \or \zstar\zstar\zstar\zstar\zstar\fi
  }
\def\zstarshape{\fontencoding{U}\fontfamily{pzd}\fontseries{m}\fontshape{n}\selectfont}
\DeclareRobustCommand{\zstar}{{\fontencoding{U}\fontfamily{pzd}\fontseries{m}\fontshape{n}\selectfont I}}

% ADDRESS
\def\institution#1{#1}
\def\cny#1{#1}

\let\email@href\@secondoftwo
\def\email{\@ifstar\@semail\@email}
\def\@semail#1{\email@href{#1}{#1}}
\def\email@prefix{e-mail:\ }
\def\@email#1{{\email@prefix\email@href{#1}{#1}}}

\ifnum\jobstart@date@info>20160307
  \def\email@href#1#2{\href{mailto:#1}{#1}}
  \def\email@prefix{}
\fi

\csuse{\fmt@name @load@printead}

\def\ead@href#1#2{\href{#1}{#2}}%
\appto\@setead@hook{%
  \protected\def\textasciitilde{\noexpand\textasciitilde}%
  \protected\def\texttildelow{\noexpand\texttildelow}%
  \protected\def\textunderscore{\noexpand\textunderscore}%
  }

\def\address{\@ifstar{\address@star}%
  {\@ifnextchar[{\address@optarg}{\address@noptarg}}}

\def\address@optarg[#1]#2{%
  \refstepcounter{address}%
  \beg@elem
  \proc@elem{address}{#2}%
  \address@fmt{\the\c@address}{\the\t@loc@notes}{\@address}\label{#1}%
  \ignorespaces}

\def\address@noptarg#1{%
  \refstepcounter{address}%
  \beg@elem
  \proc@elem{address}{#1}%
  \address@fmt{\z@}{\the\t@loc@notes}{\@address}%
  \ignorespaces
  }

\def\address@star#1{%
  \beg@elem
  \proc@elem{address}{#1}%
  \address@fmt{\m@ne}{\the\t@loc@notes}{\@address}%
  \ignorespaces
  }

\def\theaddress{\alph{address}}

\def\address@fmt#1#2#3{%
  \@newelemtrue
  \ifnum\prev@elem=\e@address \@newelemfalse \fi
  \if@newelem \address@fmt@init \fi
  \bgroup
  \parskip\z@\noindent\raggedright \address@size
  \ifnum#1=\z@
    #3\,\fm@textsuperscript{#2}\space
  \else
    \ifnum#1=\m@ne
      \phantom{\fm@textsuperscript{\theaddress}\,}#3\,\fm@textsuperscript{#2}%
    \else
      \fm@textsuperscript{\theaddress}\,#3\,\fm@textsuperscript{#2}%
    \fi
  \fi
  \par
  \egroup
  }

\def\address@fmt@init{%
  \def\@currentlabel{\theaddress}%
  \par
  \vskip 2\p@ plus 1\p@ minus 1\p@
  }

% ABSTRACT
\newskip\abstract@skip \abstract@skip=48pt
\def\abstract{\@ifnextchar[{\@abstract}{\@abstract[]}}
\def\@abstract[#1]{%
  \def\parttitle##1{\endgraf\noindent{\bfseries\MakeUppercase{##1}:}}%
  \global\@hasabstracttrue
  \if@nameyear
  \else
    \@if@vtex@in@house
      {\let\cite\abstract@cite}
      {}%
  \fi
  \hyphenpenalty\sv@hyphenpenalty
  \global\setbox\t@abstract=\vbox\bgroup\linewidth\textwidth
  \justify@on\abstract@size\parindent 1em
  \abstract@indent\abstractname@fmt{\abstractname}\ignorespaces}
\def\endabstract{\par\egroup}

\def\abstract@cite{\@ifnextchar[{\@abstract@cite}{\@abstract@cite[]}}
\def\@abstract@cite[#1]#2{%
  \def\byear##1{%
    \gdef\@abstract@cite@byear{}%
    \vtex@citex@start{}{}{}%
    \hyper@natlinkstart{#2}##1\hyper@natlinkend
    \vtex@citex@end
    }% 
  \let\@abstract@cite@byear\undefined
  \if@filesw
    \immediate\write\@auxout{\string\citation{#2}}%
  \fi
  \setbox\@tempboxa=\hbox{#1}%
  \@ifundefined{@abstract@cite@byear}
    {\@latex@error{abstract \string\cite: use the following syntax \string\cite[\string\byear{xxxx}]{label}}{}}
    {}%
  #1%
  }

% KEYWORDS
\newskip\keywords@skip \keywords@skip=12pt
\newskip\keywords@noabs@skip \keywords@noabs@skip=22pt
\newcounter{kwd}
\def\@kwd@output#1{#1}
\def\kwd#1{\stepcounter{kwd}%
  \ifnum\c@kwd=\@ne
    \@kwd@output{#1}%
  \else
    \unskip, \@kwd@output{#1}%
    \addto@keywords@list{, }%
  \fi
  \addto@keywords@list{#1}%
  \mdforvkt{main-article-info}{keyword-\thekwd}{#1}}
\def\sep{\unskip, }
\global\@haskeywordsfalse
\newdimen\dp@t@keywords
\def\keyword{\global\@haskeywordstrue%
  \global\setbox\t@keywords=\vbox\bgroup%
  \justify@on\abstract@size\parindent 0\p@
  \keywordsname\keywordsname@sep\ignorespaces
  }
\def\endkeyword{\par\egroup\global\dp@t@keywords=\dp\t@keywords}
\def\keywords#1{\begin{keyword}#1\end{keyword}}


% JOURNAL, VOLUME, ISSUE

% Running title
\def\runningtitle#1{\gdef\@runtitle{#1}}   \def\@runtitle{}
\def\runningauthor#1{{\def\etal{et al.}\gdef\@runauthor{#1\@runsep}}} \def\@runauthor{}
\def\runningsep#1{\gdef\@runsep{#1}}
\def\@runsep{\ /\ }
 
\let\runtitle\runningtitle
\let\runauthor\runningauthor

\def\journal#1{\gdef\@journal{#1}}
\@ifundefined{@journal}{\gdef\@journal{Journal not defined}}{}
\def\volume#1{\mdforvkt{main-article-info}{volume}{#1}\gdef\@volume{#1}}
\def\@volume{0}
\def\issue#1{\ios@check@supp@s#1\@nil
  \mdforvkt{main-article-info}{issue}{#1}\gdef\@issue{#1}}
\def\@issue{0}
\let\special@supplement@letter\@empty
\def\ios@check@supp@s#1#2\@nil{%
  \ifstrequal{#1}{s}{%
    \xdef\special@supplement@letter{S}%
    \protected@write\@auxout{}{\string\gdef\string\special@supplement@letter{S}}%
    \global\let\ios@old@thepage\thepage
    \gdef\thepage{\special@supplement@letter\ios@old@thepage}%
  }{}%
}

\newcount\@pubyear
\newcount\@copyear

\@copyear\@pubyear 
\ifnum\@copyear<2000 \advance\@copyear-1900 \else \advance\@copyear-2000\fi%

\def\pubyearto@error{\ClassError{iosart2x}{\string\pubyearto{...}\space is forbidden, use 
  \string\pubyearfrom{...}\space instead}\@ehc}
\AtBeginDocument{\ifcsundef{@pubyearto}{}{\ifnum\@pubyearto>\z@ \pubyearto@error \fi}}% for covers
\def\pubyearto#1{\pubyearto@error}% for normal articles

\def\@pubyearfrom@fmt{}
\def\pubyearfrom#1{%
  \gdef\@pubyearfrom{#1}%
  \gdef\@pubyearfrom@fmt{\@pubyearfrom/}%
  \ifnum#1<2000\relax
    \xdef\@copyearfrom{\the\numexpr#1-1900\relax}%
  \else
    \xdef\@copyearfrom{\the\numexpr#1-2000\relax}%
  \fi
  }% / could be easily hooked
\@onlypreamble\pubyearfrom

\def\pubyear#1{\global\@pubyear#1\relax
  \global\@copyear\@pubyear 
  \mdforvkt{main-article-info}{pubyear}{#1}%
  \ifnum\@copyear<2000\global\advance\@copyear-1900\else\global\advance\@copyear-2000\fi%
  \ignorespaces}

\pubyear{\number\year}

\def\firstpage#1{%
  \mdforvkt{main-article-info}{firstpage}{#1}%
  \def\@tempa{#1}\ifx\@tempa\@empty\else
  \gdef\@firstpage{#1}\gdef\@lastpage{#1}%
  \global\c@page=#1 \ignorespaces\fi
  }

\def\the@copyear{\ifnum\@copyear<10 0\fi\the\@copyear}
\def\the@copyearfrom{\ifcsundef{@copyearfrom}{}{\ifnum\@copyearfrom<10 0\fi\@copyearfrom/}}

\def\@firstpage{1}
\def\lastpage#1{%
  \mdforvkt{main-article-info}{lastpage}{#1}%
  \def\@tempa{#1}\ifx\@tempa\@empty\else
  \gdef\@lastpage{#1}\ignorespaces\fi}
\def\@lastpage{0}
\def\@pagerange{1--0}

% SGML:
\long\def\convertas#1#2{#2}
\def\aid#1{\gdef\@aid{#1}}

\def\SSDI#1{\gdef\@ssdi{#1}} \def\@ssdi{000000-00}
\def\issn#1{\gdef\@issn{#1}}
\def\price#1{\gdef\@price{#1}}

\def\date#1{\gdef\@date{#1}}    \def\@date{\today}

\def\empty@data{\@nil}

% \doi:
\def\doi#1{\gdef\@doi{#1}}
\def\doi@base{http://dx.doi.org/}
\let\@doi\relax

\csuse{\fmt@name @articletype}

%***************** BACKMATTER
\newcommand\backmatter{\goodbreak}

%***************** BIOGRAPHY

\csdef{known@biography@jhs@project}{1}

\define@key{biogr}{title}{\def\biographygroup@title{#1}}
\newenvironment{biographygroup}[1][title=Biography]{%
  \ifcsundef{known@biography@\@jid @project}{%
    \dbl@error{the biographygroup environment hasn't been defined for '\@jid' project}%
  }{}%
  \setkeys{biogr}{#1}%
  \section*{\biographygroup@title}%
  \global\let\ios@bio@save@label\label
}{}

\def\biography@size{}
\def\biography@figsep{1em}
\def\biography@figlift{.7em}
\def\biography@skip{1em}

\def\biography@setpar{\unkern\unpenalty\unskip \hfill\break\mbox{\kern\parindent}}%

\newbox\bio@tempboxa
\newcounter{biography}

\newenvironment{biography}{%
  \ifcsundef{known@biography@\@jid @project}{%
    \dbl@error{the biography environment hasn't been defined for '\@jid' project}%
  }{}%
  %
  \addvspace{\biography@skip}%
  %
  \stepcounter{biography}%
  %
  \biography@size
  % dummy default figure height during 1st compilation
  \ifcsundef{bio@photo@\the\c@biography @ht}{% 
    \csdef{bio@photo@\the\c@biography @ht}{5pc}%
  }{}%
  \def\photofilename##1{%
    % box for figure dimensions
    \setbox\bio@tempboxa\hbox{\includegraphics{##1}}%
    % figure height to aux (we need it when biography text is very short)
    \protected@write\@auxout{}{\string\csgdef{bio@photo@\the\c@biography @ht}{\the\ht\bio@tempboxa}}%
    % calculating figure height with space around (striping space from baseline [bs-.7em],
    % i.e. space from baseline to real text)
    \@tempdima=\dimexpr\ht\bio@tempboxa+\biography@figsep-(\baselineskip-.7em)\relax%
    % calculating, how many lines we have indent due figure
    \@tempdimb\z@ \@tempcnta\z@
    \@whiledim\@tempdimb<\@tempdima\do{%
      \advance\@tempcnta\@ne
      \advance\@tempdimb\baselineskip}%
    % putting figure
    \noindent\llap{\raisebox{%
      \the\dimexpr-\ht\bio@tempboxa+\biography@figlift\relax
      }[\z@][\z@]{\copy\bio@tempboxa}%
      \hskip\biography@figsep}%
    % making parshape settings
    \@tempcntb\z@
    \@tempdima=\dimexpr\wd\bio@tempboxa+\biography@figsep\relax
    \edef\bio@tmp{\the\numexpr\the\@tempcnta+1\relax\space}%
    \@whilenum\@tempcntb<\@tempcnta\do{%
      \edef\bio@tmp{\bio@tmp\the\@tempdima\space\the\dimexpr\hsize-\@tempdima\relax\space}%
      \advance\@tempcntb\@ne
    }%
    % saving number of indenting lines
    \xdef\@tmp@bio@num@of@lines{\the\@tempcntb}%
    % doing parshape
    \edef\bio@tmp{\bio@tmp 0pt \the\hsize}%
    \expandafter\parshape\bio@tmp%
    \ignorespaces}%
    \def\label##1{%
      \ifcsdef{ios@bio@label@\the\c@biography @used}{%
        \ClassError{iosart2x}{only one \string\label{...} is allowed in biography, 
          \string\label{##1} is excess}\@ehc%
      }{%
        \csxdef{ios@bio@label@\the\c@biography @used}{1}%
        \ifcsundef{ios@bio@##1@label}{%
          \ClassError{iosart2x}{command \string\bio{...}\space not used for label: ##1}\@ehc%
        }{}%
      }%
      \ios@bio@save@label{##1}%
    }
    % adding all biography to box for situations when text is very short
  \setbox\@tempboxa\vbox\bgroup
    \@setpar\biography@setpar
    \ignorespaces
}{\ifhmode\endgraf\fi \egroup
  \ifcsdef{ios@bio@label@\the\c@biography @used}{}{%
    \ClassError{iosart2x}{\string\label{...}\space must be used in biography}\@ehc%
  }%
  % if biography text is very short, we're making box with figure height
  \ifdim\dimexpr\ht\@tempboxa+\dp\@tempboxa\relax<\csuse{bio@photo@\the\c@biography @ht}%
    \vbox to \csuse{bio@photo@\the\c@biography @ht}{\unvbox\@tempboxa\vfill}%
  % if biography text is long, we're splitting box (by number of indenting lines)
  % and putting first part as (unbreakable) box, second as unvbox
  \else
    \setbox\bio@tempboxa = \vsplit\@tempboxa to \dimexpr\baselineskip*\@tmp@bio@num@of@lines\relax
    \box\bio@tempboxa
    \ifvoid\@tempboxa\else\unvbox\@tempboxa\fi
  \fi
}

%**************** INITIALIZATION
\gdef\refname{References}
\newcommand\figurename{Fig.}
\newcommand\tablename{Table}
\@ifversionge{110}{}{\newcommand\algorithmname{Algorithm}}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\abstractname@fmt[1]{{\bfseries #1\abstractname@sep}}
\newcommand\abstractname@sep{.\ }

\newcommand\keywordsname{Keywords}
\newcommand\keywordsname@sep{:\ }

\def\copyright@sign{\copyright}

% DIMENSIONS
\def\pretitle@size{\LARGE}
\def\title@size{\Huge}
\def\subtitle@size{\large\itshape}
\def\authors@size{\large}
\def\abstract@size{\small}
\def\abstract@indent{\noindent}
\def\address@size{\normalsize\itshape}

\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

\@twosidetrue
\pagenumbering{arabic}
\frenchspacing
\init@settings

\if@twocolumn
 \RequirePackage{flushend}
\fi

\if@twocolumn
\setlength\tablewidth{\columnwidth}
\else
\setlength\tablewidth{\textwidth}
\ifnum\ios@journal@layout>\z@
\def\footnoterule@width{144.5\p@}
\fi
\fi
\pagestyle{headings}

% esm environment for xml
\def\esm@title{Supplementary data}
\def\esm@titlesep{}
\def\esm@titlefmt{\section*{\esm@title}\esm@titlesep}
\define@key{esm}{title}{\def\esm@title{#1}}
\def\esm{\@ifnextchar[\@esm{\@esm[]}}
\def\@esm[#1]{%
  \bgroup
  \if.#1.\else\setkeys{esm}{#1}\fi
  \par
  \def\esmtitle{\@gobble}%
  \def\esmdescription{\@firstofone}%
  \def\esmfiletype{\@gobble}%
  \def\esmfilename{\@gobble}%
  \esm@titlefmt
  }
\def\endesm{\egroup}

% old definition for notes:
% \def\notes{\section*{Notes}\footnotesize}
% \def\endnotes{\par \vskip 6pt plus12pt minus2pt\relax}
% new definition for notes
\def\notes@skip{\section@beforeskip\vskip\b@section@skip}
\def\notes@size{\normalsize}
\let\notes@end@hook\@empty
\newbox\notes@box
\newenvironment{notes}{%
  \xdef\has@notes{1}%
  \global\setbox\notes@box\vbox\bgroup
  \notes@size
}{%
  \egroup
}

\RequirePackage{hyperref}
\csuse{\fmt@name @load@hypersetup}
\csuse{\fmt@name @load@vtexhdvips}
\setcounter{tocdepth}{3}
\RequirePackage{breakurl}
\csuse{\fmt@name @load@pagerefsout}

\let\ios@H@@footnotetext\H@@footnotetext
\long\def\H@@footnotetext#1{{%
  \def\@pdfview{XYZ}%
  \def\@pdfviewparams{ pdf@hoff pdf@voff \strip@pt\baselineskip\space 72.27 div 72 mul add null}%
  \ios@H@@footnotetext{#1}%
}}

\let\texttildelow\textasciitilde
\preto\hyper@normalise{\let\texttildelow\hyper@tilde}

\@ifversionge{111}
  {}
  {\ifnum\ios@journal@layout>\z@%
     \gdef\@setref#1#2#3{% csname, extract group, refname
       \ifx#1\relax
         \protect\G@refundefinedtrue
         \nfss@text{\reset@font\bfseries ??}%
         \ClassWarning{iosart2x}{Reference `#3' on page \thepage \space undefined}%
       \else
         \bgroup\ifmmode\else\upshape\fi\expandafter\Hy@setref@link#1\@empty\@empty\@nil{#2}\egroup%
       \fi
       }%
   \fi}
\@namedef{ios@section@level@1@sep}{}
\@namedef{ios@section@level@2@sep}{}
\@namedef{ios@section@level@3@sep}{}
\@namedef{ios@section@level@4@sep}{}
\@namedef{ios@section@level@5@sep}{}
\ifnum\ios@journal@layout>\z@
\@namedef{ios@section@level@4@sep}{.}
\@namedef{ios@section@level@5@sep}{.}
\fi
\def\ios@section@numlevel{0}
\def\ios@section@namelevel{undef}
\newcounter{ios@section@star}
\AtBeginDocument{%
  \global\let\ios@Sectionformat\Sectionformat
  \global\let\ios@startsection\@startsection
  \def\@startsection#1#2#3#4#5#6{%
    \xdef\ios@section@namelevel{#1}%
    \xdef\ios@section@numlevel{#2}%
    \ios@startsection{#1}{#2}{#3}{#4}{#5}{#6}%
  }%
  \gdef\Sectionformat#1#2{%
    \ios@Sectionformat{#1\@nameuse{ios@section@level@\ios@section@numlevel @sep}}{#2}%
  }%
  \let\ios@NR@ssect\NR@ssect
  \def\NR@ssect#1#2#3#4#5{%
    \stepcounter{ios@section@star}%
    \def\ios@section@star@id{\ios@section@namelevel *.\the\c@ios@section@star}%
    \pdfbookmark[\ios@section@numlevel]{#5}\ios@section@star@id
    \ios@NR@ssect{#1}{#2}{#3}{#4}{#5}%
  }%
}
%

\csuse{\fmt@name @hypermark@settings}

\def\write@pdfinfo#1#2{}

\newtoks\authors@list
\def\addto@authors@list#1{%
  \begingroup%
    \no@md@harm%
    \xdef\@act{\global\noexpand\authors@list{\the\authors@list#1}}\@act%
  \endgroup}

\newtoks\keywords@list
\def\addto@keywords@list#1{%
  \begingroup%
    \no@md@harm%
    \xdef\@act{\global\noexpand\keywords@list{\the\keywords@list#1}}\@act%
  \endgroup}

% settings
\csuse{\fmt@name @vkt@cmn@settings}

\csuse{\fmt@name @load@htmisc}

\DeclareRobustCommand*\textsubscript[1]{%
  \@textsubscript{\selectfont#1}}
\def\@textsubscript#1{%
  {\m@th\ensuremath{_{\mbox{\fontsize\sf@size\z@#1}}}}}
\let\tsup\textsuperscript
\let\tsub\textsubscript

% cases displaystyle
\@ifversionge{101}{}{\gpreto\env@cases{\everymath{\displaystyle}}}

\@nameuse{init@ios@journal@\ios@journal@layout @layout}
\@nameuse{init@ios@journal@\@JID @settings}

% aux info
\AtBeginDocument{\mdforvkt{main-article-info}{fullxml}{1}}%

\AtBeginDocument{\gdef\multi@issue@sep@diff@one{,}}%

% URILIST and OUT files pages at end document
\csuse{\fmt@name @urilist}
\csuse{\fmt@name @outfile}

%%% MISC 
\csuse{\fmt@name @speciss}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% startlocaldefs, endlocaldefs

\def\startlocaldefs{\makeatletter}
\def\endlocaldefs{\makeatother}

% greek letters for ASY are italic (except Gamma and Delta)
\ifnum\jobstart@date@info<20150922\relax
\expandafter\ifstrequal\expandafter{\@JID}{ASY}{%
\let\Theta\varTheta
\let\Lambda\varLambda
\let\Xi\varXi
\let\Pi\varPi
\let\Sigma\varSigma
\let\Upsilon\varUpsilon
\let\Phi\varPhi
\let\Psi\varPsi
\let\Omega\varOmega
}{}
\fi

%%% command for tex4ht
\let\xmlEntryAlign\@gobble
\let\xmlstring\@gobble
\let\noxml\@firstofone

% \floatanchor{<label>}
\def\floatanchor#1{%
  \ifnum\stablecompilecount>\z@% more than one compile
    \@ifundefined{r@#1}{\ClassError{iosart2x}{floatanchor: missing label '#1'}\@ehc}{}%
  \fi
}

% definitions execution after \begin{document} (for tex4ht)
\ifdefined\HCode
  {
  \catcode`#=12\relax  
  \catcode`&=6\relax 
  \gdef\startlocaldefs{%
    \catcode`#=12\relax
    \@startlocaldefs
    }
  \gdef\@startlocaldefs@toks{}%
  \long\gdef\@startlocaldefs&1\endlocaldefs{%
    \long\xdef\@startlocaldefs@toks{\detokenize{&1}}%
    \catcode`#=6\relax
    }  
  }
  \appto\document{\makeatletter\expandafter\scantokens\expandafter{\@startlocaldefs@toks}\makeatother}%
\fi

% definitions for tex4ht
\let\Mathbin\mathbin
\let\Mathrel\mathrel
\let\Mathord\mathord
\let\Mathop\mathop
\let\Mathopen\mathopen
\let\Mathclose\mathclose
\let\Mathpunct\mathpunct

% trimbox
\csuse{\fmt@name @trimbox@settings}

\@ifversionge{111}
  {\let\eqref@fontshape\@firstofone
   \def\eqref#1{\eqref@fontshape{(\ref{#1})}}}
  {}

% highlighting uncited floats in \HPROOF stage
\csuse{\fmt@name @check@floats}

% \bid{doi={...}} syntax
\let\doi@arg\@empty
\define@key{bid}{doi}{\def\doi@arg{#1}\edef\bid@exists{1}}

\def\bbl@bid#1{%
  \bgroup
  \setkeys{bid}{#1}%
  \@ifundefined{bid@exists}{}{\unskip}%
  \ifx\doi@arg\@empty\else\space\csname startchkuriskip\endcsname\split@DOI\doi@arg\csname endchkuriskip\endcsname.\fi
  \egroup
  }

\@ifversionge{112}
  {\let\bid\bbl@bid
   \csuse{\fmt@name @112@btpdefs}}
  {}

\let\bid@doi@space\relax
\def\bid@doi@sep{:}

\newcounter{doiinbid}
\def\split@DOI#1{%
  %\edef\doi@list{#1}%
  \setcounter{doiinbid}{1}%
  \@for\@curr@doi:=#1\do{%
    \ifnum\c@doiinbid>1\relax;\ \fi
    doi\bid@doi@sep\bid@doi@space\nohyphen
    \expandafter\doiurl\expandafter{\@curr@doi}%
    \stepcounter{doiinbid}%
    }%
  }

\def\level@we@seek{subsubsection}
\def\space@after@section{%
  \ifvmode
    \if@nobreak
      \vskip-\abovedisplayskip
      \vskip-\baselineskip
      \ifx\ios@section@namelevel\level@we@seek
        \vskip13.0pt plus 0.5pt minus 0.1pt
      \fi      
    \fi
  \fi
  }
\pretocmd{\equation}{\space@after@section}{}{}
\expandafter\expandafter\expandafter\pretocmd\expandafter\csname equation*\endcsname{%
  \space@after@section}{}{}
\pretocmd{\eqnarray}{\space@after@section}{}{}

\endinput
%%
%% End of file `iosart2x.cls'.