/*
 * Reference examples for JACoW conference proceedings
 *
 * Based on the JACoW guide for preparation of papers.
 * See https://jacow.org/ for more information.
 *
 * This file is part of the accelerated-jacow template.
 * Typst universe: https://typst.app/universe/package/accelerated-jacow
 * GitHub repository: https://github.com/eltos/accelerated-jacow
 */
 
#import "/jacow.typ": jacow


#show: jacow.with(
  title: [
    Reference style guide for JAC#lower[o]W papers
  ],
  show-grid: true
)

== Referencing #box[JACoW] Proceedings

Reference formatting in accordance with the JACoW Guide @jacowguide is used in the following examples.

#bibliography("test_references.bib", full: true)
