// =============================================================================
// LaTeX-style poster theme for peace-of-posters 0.6.x
// =============================================================================
#import "@preview/peace-of-posters:0.6.0" as pop

// ---- Default palette --------------------------------------------------------
#let default-palette = (
  header-from: rgb("#27c2f5"),  // blue (left)
  header-to:   rgb("#f54927"),  // yellow (right)
  header-fg:   black,           // heading text color
  box-stroke:  rgb("#9a9a9a"),
  body-fg:     black,
)

// State holder so `section` can read the active palette without args.
#let _palette = state("poster-palette", default-palette)
#let _accent  = state("poster-accent", true)

// =============================================================================
// Public API
// =============================================================================

#let setup(
  paper: "a0",
  margin: 1.5cm,
  font: ("Liberation Sans", "Lato", "New Computer Modern", "Libertinus Serif"),
  font-size: 25pt,
  spacing: 18pt,
  palette: (:),
  accent-stripe: true,
  body,
) = {
  let pal = default-palette
  for (k, v) in palette { pal.insert(k, v) }

  set page(paper, margin: margin)
  set text(font: font, size: font-size, fill: pal.body-fg)

  pop.set-poster-layout(pop.layout-a0)
  pop.update-poster-layout(spacing: spacing, body-box-spacing: spacing)

  _palette.update(pal)
  _accent.update(accent-stripe)

  body
}

/// A section box with the LaTeX-style cyan header.
/// Use this instead of `pop.column-box` directly.
#let section(title, body, stretch-to-next: false) = (
  context {
    let pal = _palette.get()

    pop.column-box(
      // Force the heading text color/weight here, ignoring the default theme.
      heading: text(fill: pal.header-fg, weight: "bold", title),
      stretch-to-next: stretch-to-next,
      heading-box-args: (
        inset: 10pt,
        width: 100%,
        fill: gradient.linear(pal.header-from, pal.header-to),
        stroke: 0.6pt + pal.box-stroke,
      ),
      body-box-args: (
        inset: 12pt,
        width: 100%,
        stroke: 0.6pt + pal.box-stroke,
      ),
      body,
    )
  }
)

/// Title bar with optional logos on either side.
#let title-bar(
  title,
  left-logo: none,
  right-logo: none,
  logo-width: 6cm,
  height: auto,
  inset: 20pt,
) = context {
  let pal = _palette.get()
  let to-img(x) = if type(x) == str { image(x, width: logo-width) } else { x }

  block(
    width: 100%,
    height: height,
    fill: gradient.linear(pal.header-from, pal.header-to),
    stroke: 0.6pt + pal.box-stroke,
    inset: inset,
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, center + horizon, right + horizon),
      column-gutter: 20pt,
      if left-logo  != none { to-img(left-logo)  } else { [] },
      text(fill: pal.header-fg, weight: "bold", size: 3.2em, title),
      if right-logo != none { to-img(right-logo) } else { [] },
    ),
  )
  v(10pt)
}

#let authors-footer(authors, size: 32pt) = {
  place(
    bottom + center,
    dx: 0pt, dy: 0pt,
    text(size: size, authors, weight: "bold"),
  )
}
