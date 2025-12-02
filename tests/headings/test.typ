#import "/jacow.typ": *

#show: jacow.with(
  paper-size: "test",
)

= Section heading
#lorem(10)

== Subsection heading
#lorem(10)

== анотація: a very long subsection heading spanning over two full lines

=== A third level heading
#lorem(10)

=== a very very very long third level heading extending over two lines
#lorem(10)

#colbreak()

= Long section heading spanning over two lines

== Second heading directly following
#lorem(10)

== Another second level heading

=== and a third level heading too
#lorem(10)

=== more third levels here
#lorem(10)

== With math like $e^x$ or $pi^+$ and NaCl plus $attach("He", tl: 4, bl: 2)$
