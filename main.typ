#set math.equation(numbering: "(1)")
#set math.vec(delim: "[", align: right)
#set math.mat(delim: "[", column-gap: 1em)
#set page(
  paper: "us-letter",
  header: [
    #smallcaps[_CS 188_]
    #h(1fr)
    #link(<toc>)[Back to TOC]
    #h(1fr)
    _Soklynin Nou_
    #line(length: 100%)
  ],
  numbering: "1",
)
#set par(
  justify: true,
)
#set text(
  font: "Libertinus Serif",
  size: 11pt,
)
#set heading(numbering: "1.")
#set list(indent: 1.2em)
#set enum(indent: 1.2em)

#let topic(title, lecture, date) = {
  align(center, text(17pt)[
    #rect(width: 80%, inset: 20pt)[
      *#title* \
      #set text(size: 12pt)
      Lecture #lecture \
      #date/25
]
])
}

#let dis(dis, date) = {
  align(center, text(12pt)[
      *Discussion #dis* \
      #date/25
])
}

#include "cover.typ"
#pagebreak()

#include "contents.typ"
#pagebreak()

#topic("Introduction", "1", "8/28")
#include "lectures/lecture-1.typ"
#linebreak()

#topic("Uninformed Search", "2", "9/02")
#include "lectures/lecture-2.typ"
#linebreak()

#topic("A* Search and Heuristics", "3", "9/04")
#include "lectures/lecture-3.typ"
#pagebreak()

#topic("Constraint Satisfaction Problems I", "4", "9/09")
#include "lectures/lecture-4.typ"
#linebreak()

#topic("Constraint Satisfaction Problems II", "5", "9/11")
#include "lectures/lecture-5.typ"
#linebreak()

#topic("Game Trees I", "6", "9/16")
#include "lectures/lecture-6.typ"
#pagebreak()

#topic("Game Trees II", "7", "9/18")
#include "lectures/lecture-7.typ"
#linebreak()

#topic("Markov Decision Processes I", "8", "9/23")
#include "lectures/lecture-8.typ"
#linebreak()

#topic("Markov Decision Processes II", "9", "9/25")
#include "lectures/lecture-9.typ"
#linebreak()

#topic("Reinforcement Learning I", "10", "9/30")
#include "lectures/lecture-10.typ"
#linebreak()

#topic("Reinforcement Learning II", "11", "10/02")
#include "lectures/lecture-11.typ"
#linebreak()

#topic("Probability", "12", "10/07")
#include "lectures/lecture-12.typ"
#linebreak()

#topic("Bayes Nets: Representation", "13", "10/09")
#include "lectures/lecture-13.typ"
#linebreak()

#topic("Bayes Nets: Independence", "14", "10/14")
#include "lectures/lecture-14.typ"
#linebreak()

#topic("Bayes Nets: Inference", "15", "10/16")
#include "lectures/lecture-15.typ"
#linebreak()

#topic("Bayes Nets: Sampling", "16", "10/21")
#include "lectures/lecture-16.typ"
#linebreak()

#topic("Decision Networks and VPI", "17", "10/23")
#include "lectures/lecture-17.typ"
#linebreak()

#topic("Hidden Markov Models", "18", "10/28")
#include "lectures/lecture-18.typ"
#linebreak()

#topic("Particle Filtering", "19", "10/30")
#include "lectures/lecture-19.typ"
#linebreak()

#topic("ML I: Naive Bayes", "20", "11/04")
#include "lectures/lecture-20.typ"
#linebreak()

#topic("ML II: Perceptrons", "21", "11/06")
#include "lectures/lecture-21.typ"
#linebreak()

#topic("ML III: Neural Networks", "22", "11/13")
#include "lectures/lecture-22.typ"
#linebreak()

#topic("ML IV: Applications & Decision Trees", "23", "11/18")
#include "lectures/lecture-23.typ"
#linebreak()

#topic("ML V: Transformers", "24", "11/20")
#include "lectures/lecture-24.typ"
#linebreak()

#topic("Applications: AI for Healthcare", "25", "11/25")
#include "lectures/lecture-25.typ"
#linebreak()



