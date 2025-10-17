#import "/jacow.typ": *

#let show-grid = true

#for group-by-affiliation in (true, false) [

  #show: jacow.with(
    paper-size: "test",
    title: [
      short title
    ],
    authors: (
      (name: "C. Author", at: "uni"),
      (name: "P. Coauthor", at: ("uni", "third")),
      (name: "J. Cockcroft", at: ("INP", "third")),
      (name: "C. D. Anderson", at: "INP"),
      (names: ("N. Bohr", "A. Einstein", "M. Curie", "E. Lawrence"), at: "INP"),
    ),
    affiliations: (
      uni: "Town University, City, Country",
      INP: "Insitute of Nobel Physics, Stockhold, Sweden",
      third: [The Third Institute, City, Country],
    ),
    group-by-affiliation: group-by-affiliation,
    abstract: lorem(2),
    show-grid: show-grid,
  )


  #show: jacow.with(
    paper-size: "test",
    title: [
      medium length title with a manual \
      line break to improve its look
    ],
    authors: (
      (name: "C. Author", at: "uni"),
      (name: "P. Coauthor", at: ("uni", "third", "INP")),
      (name: "J. Cockcroft", at: ("INP", "third", "uni")),
      (name: "C. D. Anderson", at: "INP"),
      (names: ("N. Bohr", "A. Einstein", "M. Curie", "E. Lawrence"), at: "INP"),
      (
        names: ("A. Group", "O. F. People"),
        at: "Single Use Primary Affiliation, Shortcut Way",
      ),
    ),
    affiliations: (
      uni: "\nTown University, City, Country",
      INP: "   Insitute of Nuclear Physics, University of all Applied Sciences,\n City of Nature and the Universe, Country of the People   ",
      third: [The Third Institute, City, Country],
    ),
    group-by-affiliation: group-by-affiliation,
    abstract: lorem(2),
    show-grid: show-grid,
  )


  #show: jacow.with(
    paper-size: "test",
    title: [
      very long title comprising many words and even more characters and spanning over two full lines
    ],
    authors: (
      (name: "A. Alpha", at: "CERN, Geneva, Switzerland")
    ),
    on-behalf-of: [the MICE collaboration],
    group-by-affiliation: group-by-affiliation,
    abstract: lorem(2),
    show-grid: show-grid,
  )


  #show: jacow.with(
    paper-size: "test",
    title: [
      The JAC#lower[o]W  collaboration
    ],
    funding: "As of Dec. 2018",
    authors: (
      (
        at: "CERN",
        names: (
          "C. Petit-Jean-Genaz",
          "T. Baron",
          "R. Billen",
          "P. Ferreira",
          "N. Juszka",
          "M. Kołodziejski",
          "A. Mönnich",
          "P. Poulopoulou",
          "M. Vidal",
        ),
      ),
      (name: "J. Poole", at: ("CERN", "JPS")),
      (
        at: "Argonne National Laboratory, Lemont, IL 60439, USA",
        names: ("C. E. Eyberger", "K. Jaje", "Y. Jaski"),
      ),
      (
        at: "ANSTO, Lucas Heights NSW 2234, Australia",
        names: ("D. Button", "M. Hewes"),
      ),
      (
        at: "ANSTO, Clayton VIC 3168, Australia",
        names: ("R. Dowd", "K. Riches", "E. Tan", "N. White"),
      ),
      (
        at: "Brazilian Synchrontron Light Laboratory, 13083-970 Campinas, Brazil",
        names: ("R. Picoreti", "S. Marques"),
      ),
      (
        at: "Brookhaven National Laboratory, Upton, NY 11973, USA",
        names: ("P. Dyer", "C. Hoffman"),
      ),
      (
        at: "Budker Institute of Nuclear Physics, 630090 Novosibirsk, Russia",
        names: ("M. V. Kuzin",),
      ),
      (
        at: (if group-by-affiliation { ", " } else { "" })
          + "Centre d’Etudes Nucléaires de Bordeaux Gradignan,\nUniversité de Bordeaux/IN2P3/CNRS, 33175 Gradignan, France",
        names: ("L. Serani",),
      ),
      (
        at: "Deutsches Elektronen-Synchrotron, 22607 Hamburg, Germany",
        names: ("M. Marx",),
      ),
      (
        at: "Elettra Sincrotrone Trieste, 34149 Basovizza, Italy",
        names: ("I. Andrian", "S. Deiuri"),
      ),
      (
        at: "European Spallation Source, 221 00 Lund, Sweden",
        names: ("J. Olander", "G. Trahern"),
      ),
      (at: "Fermilab, Batavia IL 60510, USA", names: ("M. Arena",)),
      (
        at: "Grand Accélérateur National d’Ions Lourds, 14076 Caen, France",
        names: ("F. Chautard",),
      ),
      (
        at: "GSI Helmholtzzentrum für Schwerionenforschung, 64291 Darmstadt, Germany",
        names: ("R. Müller", "V. R. W. Schaa"),
      ),
      (
        at: "Helmholtz-Zentrum Berlin, 14109 Berlin, Germany",
        names: ("M. McAteer",),
      ),
      (
        at: "Helmholtz-Zentrum Dresden-Rossendorf, 01328 Dresden, Germany",
        names: ("P. Neumann",),
      ),
      (
        at: "Hong Kong University of Science and Technology, Hong Kong, P. R. China",
        names: ("Y.-Y Li",),
      ),
      (at: "INFN-LNS, 95123 Catania, Italy", names: ("P. Pisciotta",)),
      (
        at: "Institute of High Energy Physics, Beijing 100049, P. R. China",
        names: ("N. Zhao",),
      ),
      (
        at: "Institute of Modern Physics, Lanzhou 730000, P. R. China",
        names: ("L. Li",),
      ),
      (
        at: "iThemba Labs, P.O. Box 722, Somerset West 7130, South Africa",
        names: ("J. G. de Villiers", "J. Mira"),
      ),
      (
        at: "KEK, Tsukuba, Ibaraki 305-0801, Japan",
        names: ("Y. H. Chin", "K. Furukawa", "T. Kosuge", "A. Shirakawa"),
      ),
      (
        at: "Illinois Institute of Technology, Chicago, IL 60616, USA",
        names: ("P. Snopok",),
      ),
      (
        at: "Cockcroft Institute, Lancaster University, Lancaster LA1 4YW, UK",
        names: ("R. Apsimon",),
      ),
      (
        at: "Los Alamos National Laboratory, Los Alamos, NM 87545, USA",
        names: ("K. A. Bishofberger",),
      ),
      (
        at: "CAMD, Louisiana State University, Baton Rouge, LA 70806, USA",
        names: ("V. G. Mitts",),
      ),
      (
        at: "Michigan State University, East Lansing, MI 48824, USA",
        names: ("K. Makino", "A. McCausey"),
      ),
      (
        at: "LEBRA, Nihon University, Funabashi 274-8501, Japan",
        names: ("T. Tanaka",),
      ),
      (
        at: "Oak Ridge National Laboratory, Oak Ridge, TN 37831, USA",
        names: ("C. Horak",),
      ),
      (
        at: "National Synchrotron Radiation Research Center, Hsinchu 30076, Taiwan, Republic of China",
        names: ("Y.-S. Cheng",),
      ),
      (
        at: "Paul Scherrer Institut, 5232 Villigen PSI, Switzerland",
        names: ("J. Chrin",),
      ),
      (
        at: "Pohang Accelerator Laboratory, Gyeongbuk, Korea",
        names: (
          "D.-E. Kim",
          "G.-H. Kim",
          "K.-S. Kim",
          "N.-Y. Kim",
          "E.-H. Lee",
        ),
      ),
      (
        at: "RIKEN, Wako, Saitama 351-0198, Japan",
        names: ("A. Uchiyama", "K. Yamada"),
      ),
      (
        at: "Shanghai Institute of Applied Physics, Shanghai 201800, P. R. China",
        names: ("H. Chen", "X. Han, W. Qi"),
      ),
      (
        at: "SLAC National Accelerator Laboratory, Menlo Park, CA 94025, USA",
        names: ("M. Montes-Loera",),
      ),
      (
        at: "STFC Daresbury Laboratory, Warrington, WA4 4AD, UK",
        names: ("S. Waller",),
      ),
      (
        at: "Synchrotron Soleil, Saint-Aubin, 91192 Gif-sur-Yvette, France",
        names: ("K. Tavakoli",),
      ),
      (
        at: "Thomas Jefferson National Accelerator Facility, Newport News, VA 23606, USA",
        names: ("E. Akers", "A. Cuffe", "T. Satogata"),
      ),
      (at: "TRIUMF, Vancouver, BC V6T 2A3, Canada", names: ("J. Thomson",)),
    ),
    affiliations: (
      CERN: "CERN, 1211 Geneva 23, Switzerland",
      JPS: "JP Scientific (Nantwich) Ltd, UK",
    ),
    group-by-affiliation: group-by-affiliation,
    abstract: lorem(2),
    show-grid: show-grid,
  )

]
