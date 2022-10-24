# babel-wylie

Mapping for Tibetan romanized in accordance with [Wylie transliteration](https://en.wikipedia.org/wiki/Wylie_transliteration)

## Dependencies

babel>=3.52

## Usage

1. Include `\usepackage{babel-wylie}` in the preamble of your LaTeX-file after loading babel,
2. specify a font for the `wylie` language, for instance `\babelfont[wylie]{rm}[Renderer=Harfbuzz]{Tibetan Machine Uni}`,
3. switch on the `wylie` language in your document with `\selectlanguage{wylie}` or `\begin{otherlanguage}{wylie} … \end{otherlanguage}`.

## Credits

[@radardenker](https://github.com/radardenker/): <https://github.com/radardenker/babel-wylie>
