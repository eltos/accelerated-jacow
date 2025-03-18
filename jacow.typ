/*
 * Typst template for papers to be published with JACoW
 *
 * Based on the JACoW guide for preparation of papers.
 * See https://jacow.org/ for more information.
 * Requires Typst version 0.12 for compiling
 *
 * This document is licensed under the GNU General Public License 3
 * https://www.gnu.org/licenses/gpl-3.0.html
 * Copyright (c) 2024 Philipp Niedermayer (github.com/eltos)
 */

#let jacow(
  title: none,
  authors: (),
  affiliations: (:),
  abstract: none,
  pubmatter: none,
  funding: none,
  paper-size: "jacow",
  abstract-title: "Abstract",
  bibliography-title: "References",
  page-limit: none,
  show-grid: false,
  body,
) = {

  // Pubmatter support
  if pubmatter != none {
    if title == none {
      title = pubmatter.title
    }
    if authors.len() == 0 {
      authors = pubmatter.authors.map(a => {
        a.insert("at", a.affiliations.map(a => a.id))
        a
      })
    }
    if affiliations.len() == 0 {
      affiliations = pubmatter.affiliations.map(a => (a.id, a.name)).to-dict()
    }
    if abstract == none {
      abstract-title = pubmatter.abstracts.at(0).title
      abstract = pubmatter.abstracts.at(0).content
    }
  }


  // sanitize author list
  for a in authors.filter(a => "names" in a.keys()) {
    for name in a.remove("names") {
      authors.insert(-1, (name: name, ..a))
    }
  }
  authors = authors.map(a => {
    if "by" in a.keys() { a.insert("name", a.remove("by")) }
    if "at" in a.keys() { a.insert("affiliation", a.remove("at")) }
    if type(a.affiliation) == str {  // ensure affiliation is an array
      a.insert("affiliation", (a.remove("affiliation"),));
    }
    if "name" in a.keys() {a.insert("name", a.name.trim(" "))}
    a
  })
  authors = authors.filter(a => "name" in a.keys())

  // sort authors: corresponding first, then alphabetic by last name
  authors = authors.sorted(key: a => if "email" in a {" "} + a.name.split(" ").last())


  /// Helper for custom footnote symbols
  let titlenotenumbering(i) = {
    if i < 6 { ("*", "#", "§", "¶", "‡").at(i - 1)}
    else { (i - 4)*"*" }
  }

  /// Capitalize all characters in the text, e.g. "THIS IS AN ALLCAPS HEADING"
  let allcaps = upper

  /// Capitalize major words, e.g. "This is a Word-Caps Heading"
  /// Heuristic until we have https://github.com/typst/typst/issues/1707
  let wordcaps(body) = {
    if body.has("text") {
      let txt = body.text //lower(body.text)
      let words = txt.matches(regex("^()(\\w+)")) // first word
      words += txt.matches(regex("([.:;?!]\s+)(\\w+)")) // words after punctuation
      words += txt.matches(regex("()(\\w{4,})")) // words with 4+ letters
      for m in words {
        let (pre, word) = m.captures
        word = upper(word.at(0)) + word.slice(1)
        txt = txt.slice(0, m.start) + pre + word + txt.slice(m.end)
      }
      txt
    } else if body.has("children") {
      body.children.map(it => wordcaps(it)).join()
    } else {
      body
    }
  }





  // metadata

  set document(title: title, author: authors.map(author => author.name))



  // layout

  set page(columns: 2,
    ..if paper-size == "a4" {
      (paper: "a4", margin: (top: 37mm, bottom: 19mm, x: 20mm))
    } else if paper-size in ("letter", "us-letter") {
      (paper: "us-letter", margin: (y: 0.75in, left: 0.79in, right: 1.02in))
    } else if paper-size == "jacow" { // jacow size is intersection of both
      (width: 21cm, height: 11in, margin: (x: 20mm, y: 0.75in))
    } else if paper-size == "test" {
      (width: 21cm, height: auto, margin: (x: 20mm, y: 0.75in))
    } else {
      panic("Unsupported paper-size, use 'a4', 'us-letter' or 'jacow'!")
    },
    ..if show-grid {
      (background: [
        #let at = (x: 0pt, y: 0pt, c) => place(bottom + left, move(dx: x, dy: -y, c))
        // grid
        #for i in range(-1, 28){
          let style = (length: 100%, stroke: silver)
          at(x: 20mm + i*1cm, line(angle: 90deg, ..style))
          at(y: 0.75in + i*0.5in, line(..style))
          set text(fill: gray.darken(50%))
          at(x: 20mm + i*1cm, y: 0.25in, if i == 1 [1 cm] else if i >= 0 [#i])
          at(x: 1cm, y: 0.75in + i*0.5in, if i == 1 [½ in] else if i >= 0 {str(i/2).replace(".5", "½")})
        }
        // page and column borders
        #at(rect(width: 21cm, height: 29.7cm)) // DIN A4
        #at(rect(width: 8.5in, height: 11in)) // US letter
        #at(x: 2cm, y: 0.75in, rect(width: 82.5mm, height: 9.5in, stroke: green))
        #at(x: 19cm, y: 0.75in, rect(width: -82.5mm, height: 9.5in, stroke: green))
      ])
    }
  )

  set columns(gutter: 0.2in)

  set text(
    font: "TeX Gyre Termes",
    size: 10pt
  )

  set par(
    spacing: 0.65em,
    leading: 0.5em,
  )

  // Page limit warning
  set page(
    // add note in header until we have https://github.com/typst/typst/issues/1322
    header: context if page-limit != none and query(<references>).at(0).location().page() > page-limit {
      text(fill: red, size: 14pt, weight: "bold")[Paper exceeds limit of #page-limit pages!]
    },
  )


  // Note: footnotes not working in parent scoped placement with two column mode.
  // See https://github.com/typst/typst/issues/1337#issuecomment-1565376701
  // As a workaround, we handle footnotes in the title area manually.
  // An alternative is to not use place and use "show: columns.with(2, gutter: 0.2in)" after the title area instead of "page(columns: 2)",
  // but then footnotes span the full page and not just the left column.
  //let titlefootnote(text) = { footnote(numbering: titlenotenumbering, text) }
  let footnotes = state("titlefootnotes", (:))
  footnotes.update(footnotes => (:)) // For multiple papers in a single file
  let titlefootnote(text) = {
    footnotes.update(footnotes => {
      footnotes.insert(titlenotenumbering(footnotes.len()+1), text)
      footnotes
    })
    h(0pt, weak: true)
    context{super(footnotes.get().keys().at(-1))}
  }

  show footnote.entry: set align(left)
  show footnote.entry: set par(hanging-indent: 0.57em)
  set footnote.entry(
    indent: 0em,
    separator: [
      #set align(left)
      #line(length: 40%, stroke: 0.5pt)
    ]
  )



  place(
    top + center,
    scope: "parent",
    float: true,
    {

      set align(center)
      set par(justify: false)
      set text(hyphenate: false)

      /*
       * Title
       */

      text(size: 14pt, weight: "bold", [
        #allcaps(title)
        #if funding != none { titlefootnote(funding) }
      ])
      v(8pt)


      /*
       * Author list
       */

      let keep-together(content) = {
        if type(content) == str and "\n" in content { // allow manual linebreaks
          show " ": sym.space.nobreak
          show "-": sym.hyph.nobreak
          content
        } else {
          set box(fill: green.lighten(50%), stroke: green.lighten(50%)) if show-grid
          box(content)
        }
      }

      text(size: 12pt, {
        let also_at = ();
        for aff in authors.map(a => a.affiliation.at(0)).dedup() {
          for auth in authors.filter(a => a.affiliation.at(0) == aff) {
            // author name with superscripts
            keep-together({
              auth.name
              for aff2 in auth.affiliation.slice(1) {
                if aff2 not in also_at { also_at += (aff2,) }
                super(str(also_at.len()))
              }
              if "email" in auth { titlefootnote(auth.email) }
              ","
            })
            " "
          }
          // primary affiliations
          let a = affiliations.at(
            // allow passing prim. aff. directly, but only if it's a proper one
            aff, ..if "," in aff {(default: aff)}
          )
          if type(a) == str {
            // trim whitespaces, but allow newlines at start for manual linebreak
            a = a.trim(" ").trim(at: end)
          }
          keep-together(a) + "\n"
        };
        // secondary affiliations
        for i in range(also_at.len()) {
          let a = affiliations.at(also_at.at(i)) // sec. aff. only via key
          if type(a) == str { a = a.trim() }
          keep-together(
            super(str(i + 1)) + "also at " + a
          )
          "\n"
        };
      })
      v(1pt)


    }
  )


  context{
    for (symbol, text) in footnotes.get() {
      place(footnote(numbering: it => "", {super(symbol) + sym.space.med + text}))
    }
  }



  /*
   * Contents
   */

  // paragraph
  set align(left)
  set par(
    first-line-indent: 1em,
    justify: true,
  )
  //show: columns.with(2, gutter: 0.2in)


  // SECTION HEADINGS
  show heading.where(level: 1): it => {
    set align(center)
    set text(size: 12pt, weight: "bold", style: "normal", hyphenate: false)
    block(
      below: 2pt,
      allcaps(it.body)
    )
    h(1em)
  }

  // Subsection Headings
  show heading.where(level: 2): it => {
    set align(left)
    set text(size: 12pt, weight: "regular", style: "italic", hyphenate: false)
    block(
      below: 2pt,
      wordcaps(it.body)
    )
    h(1em)
  }

  // Third-Level Headings
  show heading.where(level: 3): it => {
    v(6pt)
    text(size: 10pt, weight: "bold", style: "normal", wordcaps(it.body))
    h(0.5em)
  }

  // lists
  show list: set list(indent: 1em)

  // figures
  show figure: set figure(placement: auto)
  show figure.where(placement: none): it => {
    // add a little spacing for inline figures and tables
    v(0.5em)
    it
    v(0.5em)
  }
  show figure.caption: it => {
    set par(first-line-indent: 0em)
    layout(size => context {
      align( // center for single-line, left for multi-line captions
        if measure(it).width < size.width { center } else { left },
        if sys.version.at(1) >= 13 {
          // workaround for https://github.com/typst/typst/issues/5472#issuecomment-2730205275
          block(width: size.width, context[#it.supplement #it.counter.display()#it.separator#it.body])
        } else {
          block(width: size.width, it) // use full width and justify
        }
      )
    })
  }

  // tables
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  // equations
  set math.equation(numbering: "(1)")
  show math.equation: it => {
    if it.block and not it.has("label") [
        #counter(math.equation).update(v => v - 1)
        #math.equation(it.body, block: true, numbering: none)#label("")
    ] else {
      it
    }  
  }

  // references
  set ref(supplement: it => {
    if it.func() == figure and it.kind == image {
      "Fig."
    } else if it.func() == math.equation {
      "Eq."
    } else {
      it.supplement
    }
  })

  // bibliography
  set bibliography(title: [#bibliography-title <references>], style: "jacow.csl")
  show bibliography: it => {
    set text(9pt)
    set par(spacing: 9pt)
    show link: it => text(font: "DejaVu Sans Mono", size: 7.2pt, it)
    it
  }


  // abstract
  if abstract != none [
    == #abstract-title
    #abstract
  ]


  // content
  body


}



/// Table in jacow style
///
/// - spec (str): Column alignment specification string such as "ccr"
/// - header (alignment, none): header location (top and/or bottom) or none
/// - contents: table contents
/// -> table
#let jacow-table(spec, header: top, ..contents) = {
  spec = spec.codepoints()
  if header == none { header = alignment.center }
  let args = (
    columns: spec.len(),
    align: spec.map(i => (a: auto, c: center, l: left, r: right).at(i)),
    stroke: (x, y) => {
      if y == 0 {(top: 0.08em, bottom: if header.y == top {0.05em})}
      else if y > 1 {(top: 0em, bottom: 0.08em)}
    },
  )
  for (key, value) in contents.named() {
    args.insert(key, value)
  }

  show table.cell.where(y: 0): it => if header.y == top {strong(it)} else {it}
  show table.cell.where(x: 0): it => if header.x == left {strong(it)} else {it}

  table(
    ..args,
    ..contents.pos(),
  )
}


