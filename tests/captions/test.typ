#import "/jacow.typ": jacow, jacow-table


#show: jacow.with(
  title: [
    Figure caption test
  ],
  show-grid: true,
  paper-size: "test",
)

#figure(
  box(fill: silver, width: 100%, height: 1cm),
  placement: none,
  caption: [Short caption centered],
)

#figure(
  box(fill: silver, width: 100%, height: 1cm),
  placement: none,
  caption: [Medium caption with two lines, spanning the entire width and left aligned],
)

#figure(
  box(fill: silver, width: 100%, height: 1cm),
  placement: none,
  caption: [Long caption #lorem(50)],
)

#colbreak()

#figure(
  table(columns: (1fr, 1fr, 1fr))[S],
  placement: none,
  caption: [Short table caption],
)

#figure(
  table(columns: (1fr, 1fr, 1fr))[M],
  placement: none,
  caption: [Medium caption with two lines, spanning the entire width and left aligned],
)

#figure(
  table(columns: (1fr, 1fr, 1fr))[XL],
  placement: none,
  caption: [Long caption #lorem(50)],
)

#figure(
  box(fill: silver, width: 100%, height: 1cm),
  scope: "parent",
  placement: bottom,
  caption: [Short caption centered],
)

#figure(
  box(fill: silver, width: 100%, height: 1cm),
  scope: "parent",
  placement: bottom,
  caption: [Medium caption with two lines, spanning the entire width and left aligned as soon as the caption text is long enought to go into the second line],
)

#figure(
  box(fill: silver, width: 100%, height: 1cm),
  scope: "parent",
  placement: bottom,
  caption: [Long caption #lorem(42)],
)