#import "/jacow.typ": *
#import "@preview/pubmatter:0.2.0"

#show: jacow.with(
  paper-size: "test",
  pubmatter: pubmatter.load(yaml("frontmatter.yml")),
)

#show: jacow.with(
  paper-size: "test",
  title: "Accelerated JACoW paper template for conference proceedings",
  authors: (
    (name: "C. Author", at: "uni", email: "mail@example.com"),
    (name: "P. Coauthor", at: ("uni", "third")),
    (name: "J. Cockcroft", at: ("INP", "third")),
    (name: "C. D. Anderson", at: "INP"),
    (names: ("N. Bohr", "A. Einstein", "M. Curie", "E. Lawrence"), at: "INP"),
  ),
  affiliations: (
    uni: "Town University, City, Country",
    INP: "Insitute of Nobel Physics, Stockhold, Sweden",
    third: "The Third Institute, City, Country",
  ),
  abstract: [
    This document shows how to use the accelerated-jacow
    paper template to compose papers for JACoW conference
    proceedings. Lorem ipsum dolor sit amet, consectetur adip-
    iscing elit, sed do eiusmod tempor incididunt ut labore et
    dolore magnam aliquam quaerat.
  ],
)