#let report(
  title: "タイトル",
  sub-title: "サブタイトル",
  date: "2005年1月5日",
  student-id: "学籍番号",
  author: "氏名",
  paper-size: "a4",
  body,
) = {
  set document(title: title, author: author)
  set text(
    font: "Noto Serif JP",
    size: 12pt
  )
  set page(
    paper: paper-size,
    margin: (bottom: 1.75cm, top: 2.25cm),
  )
  set par(leading: 1em)

  align(center)[
    #v(15%)
    #text(30pt)[#title] \
    #text(15pt)[#sub-title]
    #v(50%)
    #text(15pt)[
      #date \
      #student-id #h(10pt) #author
    ]

    #pagebreak()
  ]

  set par(
    leading: 0.78em,
    first-line-indent: 14pt,
    justify: true
  )
  show par: set block(spacing: 0.5em)

  set heading(numbering: (..nums) => {
    nums.pos().map(str).join(".") + " "
  })
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    set text(weight: "bold", size: 20pt)
    set block(spacing: 1.5em)
    let pre_chapt = text()[
        #numbering(it.numbering, ..counter(heading).at(it.location()))
    ]
    text()[
      #v(20pt)
      #pre_chapt#it.body \
      #v(10pt)
    ]
  }
  show heading.where(level: 2): it => {
    set text(weight: "bold", size: 20pt)
    set block(spacing: 1.5em)
    let pre_chapt = text()[
      #numbering(it.numbering, ..counter(heading).at(it.location()))
    ]
    text()[
      #v(20pt)
      #pre_chapt#it.body \
      #v(10pt)
    ]
  }
  show heading: it => {
    set par(first-line-indent: 0pt)
    it
  }

  set page(
    footer: [
      #align(center)[#counter(page).display("1")]
    ]
  )

  counter(page).update(1)

  body
}