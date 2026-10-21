# typst-poster-template

An A0-size poster template for [Typst](https://github.com/typst/typst), meant
for conferences and similar events. The template extends
[peace-of-posters](https://typst.app/universe/package/peace-of-posters/).

## Usage

There are multiple ways to install `typst-cli`. The simplest (assuming that you
have a Rust toolchain installed) is:

```
cargo install --locked typst-cli
```

You can then install the base template used by the poster with:

```
typst init @preview/peace-of-posters:0.6.0
```

To compile the template as-is, run:

```
typst compile poster_template.typ
```

Details on how to modify the template for your needs can be found in the Typst
documentation. The [tutorial](https://typst.app/docs/tutorial/) is a good place
to start.

## Examples

The `examples/` directory contains `tgamblin_riscv_boardfarm.pdf`, which was a
real poster printed and displayed at [RISC-V Summit EU
2026](https://riscv-europe.org/summit/2026/).
