#import "/jacow.typ": jacow, jacow-table

#show: jacow.with(
  //paper-size: "a4",
  show-grid: true,
  
  // Paper title
  title: [
    Preparation of Papers for JAC#lower[o]W conferences
  ],
  // Author list
  authors: (
    (name: "A. N. Author", affiliation: "a", email: "email address"),
    (name: "H. Coauthor", affiliation: "a"),
    (name: "P. Contributor", affiliation: ("b", "c")),
  ),
  affiliations: (
    a: "Name of Institute or Affiliation, City, Country",
    b: "Name of Institute or Affiliation, City, Country",
    c: "Name of Secondary Institute or Affiliation, City, Country",
  ),
  // Funding note (optional, comment out if not applicable)
  funding: "Work supported by ...",
  // Paper abstract
  abstract: [
    Many conference series have adopted the same standards
    for electronic publication and have joined the Joint Accelerator
    Conferences Website (JACoW) collaboration for the
    publication of their proceedings. This document describes
    the common requirements for the submission of papers to
    these conferences. Please consult individual conference 
    information for page limits, method of electronic submission,
    etc. It is not intended that this should be a tutorial in word
    processing; the aim is to explain the particular requirements
    for electronic publication at www.JACoW.org. The abstract
    itself is to act as a stand-alone entity and, as such, should
    not include citations. Any acronyms should be expanded on
    their first occurrence, both in the abstract and in the rest of
    the paper. The abstract itself is to act as a stand-alone entity
    and, as such, should not include citations. Any acronyms
    should be expanded on their first occurrence, both in the
    abstract and in the rest of the paper.
  ],
)

// Other useful packages
//#import "@preview/quick-maths:0.1.0"
//#import "@preview/physica:0.9.3"
#import "@preview/unify:0.6.0": unit,num,qty,numrange,qtyrange



= Submission of Papers
Each author should submit the PDF file and all source
files (text and figures) to enable the paper to be reconstructed
if there are processing difficulties.

= Manuscript
Templates are provided for recommended software and authors are advised to use them.
Please consult the individual conference help pages if questions arise.

== General layout
These instructions are a typical implementation of the
requirements. Manuscripts should have:
- Either A4 (21.0 cm $times$ 29.7 cm; 8.27 in $times$ 11.69 in)
  or US letter size (21.6 cm $times$ 27.9 cm; 8.5 in $times$ 11.0 in) paper.
- Single-spaced text in two columns of 82.5 mm (3.25 in)
  with 5.3 mm (0.2 in) separation. More recent versions
  of Microsoft Word have a default spacing of 1.5 lines;
  authors must change this to 1 line.
- The text located within the margins specified in @table:margins

== Fonts

In order to produce good Adobe Acrobat PDF files, authors
using the ‘jacow’ LATEX template are asked to use only
the fonts defined in the ‘jacow’ class file (v2.3 of 2019/01/15)
in standard, bold (i. e., \\textbf) or italic (i. e., \\textit)
form and symbols from the standard set of fonts. In Word
use only Symbol and, depending on your platform, Times
or Times New Roman fonts in standard, bold or italic form.

The layout of the text on the page is illustrated in Fig. 1.
Note that the paper’s title and the author list should be the
width of the full page. Tables and figures may span the
whole 170 mm page width, if desired (see Fig. 2), but if they
span both columns, they should be placed at either the top
or bottom of a page to ensure proper flow of the text (which
should flow from top to bottom in each column).


#figure(
  jacow-table("lcc",
    [Margin], [A4 Paper],        [US Letter Paper],
    [Top],    [37 mm (1.46 in)], [0.75 in (19 mm)],
    [Bottom], [19 mm (0.75 in)], [0.75 in (19 mm)],
    [Left],   [20 mm (0.79 in)], [0.79 in (20 mm)],
    [Right],  [20 mm (0.79 in)], [1.02 in (26 mm)],
  ),        
  placement: top, // top, bottom or auto
  caption: [Margin Specifications],
) <table:margins>


#figure(
  box(fill: silver, width: 75%, height: 7cm),
  placement: none,
  caption: [Layout of papers.],
) <fig:rect>

== Title and author list

The title should use 14 pt bold uppercase letters and be
centred on the page. Individual letters may be lowercased
to avoid misinterpretation (e. g., mW, GeV, SPring-8, Swiss-
FEL). To include a funding support statement, put an asterisk
after the title and the support text at the bottom of the first
column on page 1—in Word, use a text box; in LATEX, use
\thanks. See also the subsection on footnotes.






