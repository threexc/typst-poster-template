#import "theme.typ": setup, title-bar, authors-footer, section

#show: setup.with(
  paper: "a0",
  margin: 1.5cm,
)

// ---- Title bar with two logos ----
#title-bar(
  [Main Title of Your Poster: \
   A Descriptive Subtitle \
   Spanning Multiple Lines],
  left-logo:  "images/logo_left.png",
  right-logo: "images/logo_right.png",
  logo-width: 7cm,
)

#v(12pt)

// ---- Two-column body ----
#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,

  // ===== LEFT COLUMN =====
  [
    #section[First Topic Heading][
      - First key point about the topic, with *bold emphasis* on the important term
      - Second point providing additional context or motivation
      - *A highlighted concept* with supporting details and a brief explanation
      - *Concrete example:* a short, illustrative case showing why the problem matters in practice
    ]

    #section[Goals][
      + *Primary goal* — short description of what you aim to achieve and why
      + Enable *secondary outcomes* such as *feature A*, *feature B*, *feature C*

      Some of the tools/methods we use:
      - *Tool one*, *tool two*, *tool three* (with project-specific modifications)
      - *Tool four* to support cross-platform or auxiliary workflows
      - *Continuous integration pipelines* based on community standards
    ]

    #section[Challenges][
      Some *obstacles* we encounter are:
      - *Long iteration time:* describe the slow loop here
      - *Limited resources:* what's scarce and how it constrains the work
      - *Combinatorial complexity:* big test/configuration matrix
      - *Bespoke work:* each case requires a distinct solution

      *Three complexity tiers* for items in this work:
      + *Easy:* trivial change to existing infrastructure
      + *Medium:* moderate adjustments, some new dependencies
      + *Hard:* major overhaul or upstream collaboration required
    ]
  ],

  // ===== RIGHT COLUMN =====
  [
    #section[Process Overview][
      #figure(
        image("images/generic_process.jpg", width: 100%),
        caption: [High-level overview of the process and how the pieces fit together.],
        supplement: [Figure],
      )
    ]

    #section[Results: The `main_repository`][
      #set text(size: 22pt)
      #figure(
        table(
          columns: (auto, auto, 1em, auto, auto),
          align: (left, right, center, left, right),
          stroke: none,
          table.header(
            [*Item*], [*Rank*], [], [*Item*], [*Rank*],
          ),
          [*item-one*],     [1],  [], [item-sixteen],     [16],
          [*item-two*],     [2],  [], [item-seventeen],   [17],
          [*item-three*],   [3],  [], [item-eighteen],    [18],
          [*item-four*],    [4],  [], [item-nineteen],    [19],
          [*item-five*],    [5],  [], [item-twenty],      [20],
          [item-six\*],     [6],  [], [*item-twentyone*], [21],
          [*item-seven*],   [7],  [], [item-twentytwo],   [22],
          [*item-eight*],   [8],  [], [*item-twentythree*],[23],
          [item-nine\*],    [9],  [], [item-twentyfour],  [24],
          [*item-ten*],    [10],  [], [*item-twentyfive*],[25],
          [item-eleven],   [11],  [], [*item-twentysix*], [26],
          [item-twelve\*], [12],  [], [item-twentyseven], [27],
          [*item-thirteen*],[13], [], [item-twentyeight], [28],
          [*item-fourteen*],[14], [], [*item-twentynine*],[29],
          [*item-fifteen*],[15],  [], [item-thirty],      [30],
        ),
        caption: [Top 30 example items, with status indicators.],
        supplement: [Table],
      )

      - *Bold:* currently supported; *asterisks (\*):* planned
      - Many others supported/planned, e.g. *example-a*, *example-b*, *example-c*, *example-d*, and more
      - Currently covers *configuration set 1, 2, 3, 4*
      - Full list and project documentation can be found at:
    ]
  ],
)

#v(12pt)

// ---- Full-width acknowledgements ----
#section[Acknowledgements][
  We would like to thank *Sponsoring Organization* for funding this work, along with
  the upstream maintainers and collaborators whose efforts have served as the
  foundation for the contributions described above.

  #v(8pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    image("images/qr_left.png",      width: 3cm),
    image("images/sponsor_logo.png", width: 8cm),
    image("images/qr_right.png",     width: 3cm),
  )
]

// ---- Authors footer ----
#authors-footer[
  First Author (first\@example.com), \
  Second Author (second\@example.com), \
  Third Author (third\@example.com)
]
