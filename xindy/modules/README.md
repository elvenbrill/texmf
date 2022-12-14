# Getting Xindy to work for IAST-encoded text

- Author: Dominik Wujastyk
- Date: 2016-07-26
- Source:
  <http://cikitsa.blogspot.bg/2016/07/getting-xindy-to-work-for-iast-encoded.html>

Xindy (`fleXible INDexing sYstem`) is a flexible index processor that creates
tagged index for publication system. xindy merges, sorts, and outputs markup for
raw index entries. It is highly configurable. It supports many languages.

## Sources

The main distribution of Xindy is included in TeXlive and is
[downloadable at CTAN](https://www.ctan.org/pkg/xindy?lang=en). At the time of
writing (July 2016), this is version 2.5.1 (2014). The source code used to be
maintained at Sourceforge
([Xindy at sourceforge](http://xindy.sourceforge.net/), currently version 2.3
from 2008), but a later version is now available at Github
([Xindy at Github](https://github.com/jschrod/xindy.ctan)). Since Github has
version 2.5.0, source development and compilation for TeXlive must be going on
somewhere else, but I don't know where. The best place to fetch Xindy if you
want to tinker with it is from the
[CTAN base directory](https://www.ctan.org/tex-archive/indexing/xindy/base).

## Use and benefits

The development of Xindy is uneven, given the various repositories with
different versions. The documentation is also of limited use to beginners, being
technical and out of date (the examples in the tutorial do not work with the
current software release). Nevertheless, it is a very flexible and powerful
program, and does a great job when it works. And for many texts and nearly fifty
modern languages, it "just works," which is great.

In LaTeX documents, the packages index, makeidx or imakeidx will normally be
used to provide the macros needed for indexes. Xindy does the rest.

## Sanskrit and IAST

For my writing, I normally use XeTeX with LaTeX and I write using Unicode UTF8
encoding and the IAST transliteration scheme when doing Sanskrit in Roman
script. (For Devanagari I use normal Unicode encoding.)

Xindy by itself doesn't recognize the IAST accented characters like vowels with
a macron or consonants with under-dot. I found that setting Xindy's language to
"general" did a pretty good job of nearly all the characters, but not all. I got
words with ??-, ???- etc. at the beginning of the index, before "A."

## Difficulties

The program for creating a new "alphabet" for Xindy is in Perl and is called
make-rules. I couldn't initially find it at all, because it isn't at the
Sourceforge or GitHub repositories (or I couldn't find it). Later, I found it at
[CTAN](https://www.ctan.org/tex-archive/indexing/xindy/base), and I wish I'd
seen that earlier.

Finally, I could not get make-rules to work. The documentation and tutorials
simply didn't provide me with enough accurate information to start, as a
beginner, and get a workable result from make-rules.

## Solution (aka kludge)

I therefore made up a very simple Xindy style file, `IAST.xdy`, with the
following content:

```text
(merge-rule "??" "a")
(merge-rule "??" "a")
(merge-rule "???" "d")
(merge-rule "???" "d")
(merge-rule "???" "h")
(merge-rule "???" "h")
(merge-rule "??" "i")
(merge-rule "??" "i")
(merge-rule "???" "l")
(merge-rule "???" "l")
(merge-rule "???" "l")
(merge-rule "???" "l")
(merge-rule "???" "m")
(merge-rule "???" "m")
(merge-rule "m??" "m")
(merge-rule "M??" "m")
(merge-rule "???" "n")
(merge-rule "???" "n")
(merge-rule "???" "n")
(merge-rule "???" "n")
(merge-rule "???" "r")
(merge-rule "???" "r")
(merge-rule "???" "r")
(merge-rule "???" "r")
(merge-rule "???" "s")
(merge-rule "???" "s")
(merge-rule "??" "s")
(merge-rule "??" "s")
(merge-rule "???" "t")
(merge-rule "???" "t")
(merge-rule "??" "u")
(merge-rule "??" "u")
```

Then,

- I place IAST.xdy in my local TeX tree, namely as
  `../localtexmf/xindy/modules/IAST.xdy`
- I run `"sudo mktexlsr"` to rebuild the TeXlive indexes so that Xindy can find
  IAST.xdy
- I then run Xindy from the Linux command line with the following syntax:

```tex
texindy -I xelatex -M iast.xyd -L general -o foobar.ind foobar.idx
```

This last point is a Knuthian white lie (TeXbook, vii). I currently use
TeXStudio for actual writing, so the above "command line" is entered into
TeXStudio's "options/configure/commands" menu and invoked with a convenient
function-key shortcut.

### Explanation

- `texindy` is just xindy with some tweaks for use with LaTeX
- `-I` means the input file use "xelatex" encoding, i.e., UTF8
- `-M` means please use this style file
- `-L` means please use the pseudo-language "general" which does the right thing
  with most UTF8-encoded Roman / European text
- `"foobar"` is replaced by your TeX filename; in TeXStudio's syntax it's `"%"`,
  which stands for whatever file you're currently working on

I'm now getting results that look like this, which is what I was after:

![xindy-iast](https://raw.githubusercontent.com/elvenbrill/assets/6ab2ceaaccac30d97e99481c3223e50eb877e80d/texmf/xindy-iast.png)

I'm sure that all this could be done more elegantly and completely. In the
longer run, I hope a successor to IAST.xdy might take its place alongside all
the other languages formally supported by Xindy.

While working on this, I sent cries for help to the Xindy discussion list.
Zdenek Wagner replied, and shared with me work he has done towards indexing
Hindi and Marathi in Devanagari script.
