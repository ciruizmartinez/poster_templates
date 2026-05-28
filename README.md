# Personal Poster Template

A modern LaTeX poster template based on Gemini [beamerposter] theme with support for **switchable vertical and horizontal orientations**.

## Your Current Posters

### Vertical Poster (Default)
Current configuration generates a vertical (portrait) poster at **84.1" × 118.9"**:
- **File:** `poster.pdf` (generated locally, private - not in GitHub)
- **Layout:** Single column, full width
- **Status:** ✓ Built and ready to use

### Horizontal Poster  
To build a horizontal (landscape) poster at **118.9" × 84.1"**:
1. Edit `poster.tex` line 8: Change `\VerticalPostertrue` to `\VerticalPosterfalse`
2. Run `make clean && make`
3. Output: `poster.pdf` (horizontal layout)
- **Layout:** Three columns side-by-side
- **Status:** ✓ Tested and working

**Note:** Both poster types are generated as `poster.pdf` - edit the orientation setting at the top of `poster.tex` to switch between them.



## Quick Start: Switching Orientations

Toggle between vertical (84.1" × 118.9") and horizontal (118.9" × 84.1") layouts by editing `poster.tex` lines 7-9:

```latex
\newif\ifVerticalPoster
\VerticalPostertrue       % For VERTICAL poster (84.1" x 118.9")
% \VerticalPosterfalse   % For HORIZONTAL poster (118.9" x 84.1")
```

Then run: `make clean && make`

**All layout adjustments (columns, spacing, dimensions) happen automatically!**

### Privacy Note

Your generated `poster.pdf` files are **automatically excluded from GitHub** via `.gitignore`. All `*.pdf` files are private and only exist locally on your machine. Share them individually if needed.

## Dependencies

- A TeX installation that includes [LuaTeX]
    - You also need `latexmk` if you want to use the provided `Makefile`
- LaTeX package dependencies including beamerposter (these usually come with your TeX installation, but if not, you can get them from [CTAN])
- [Raleway] and [Lato], which are both available under Open Font License

## Setup & Usage

1. Copy the files in this repository (or clone the repository)

1. In `poster.tex`, set your desired orientation at the top of the file (lines 7-9)

1. Set up your paper dimensions, column layout, and scale the content as necessary

1. Make a copy of `beamercolorthemegemini.sty`, update the `\usecolortheme` line in `poster.tex`, and theme the poster to your liking (optional, but highly recommended)

1. Run `make` to build your poster

## Orientation Switching

### What Happens Automatically

When you toggle the orientation, the following adjustments happen **automatically**:

#### Dimensions
- **Horizontal:** width=118.9", height=84.1" (landscape)
- **Vertical:** width=84.1", height=118.9" (portrait)

#### Column Layout
- **Horizontal:** 3 columns @ 0.3\paperwidth each, with 0.025\paperwidth margins
- **Vertical:** 1 column @ 0.9\paperwidth wide, with 0.05\paperwidth margins

#### Font Scaling & Spacing
All font sizes and spacing scale proportionally with the poster dimensions.

### Advanced: Customizing Column Layout

To use a different column layout (e.g., 2 columns for vertical), edit the "Lengths" section in `poster.tex` (around line 48):

```latex
\ifVerticalPoster
  % Vertical: 2 column layout (example)
  \setlength{\sepwidth}{0.025\paperwidth}
  \setlength{\colwidth}{0.45\paperwidth}
\else
  % Horizontal: 3 column layout
  \setlength{\sepwidth}{0.025\paperwidth}
  \setlength{\colwidth}{0.3\paperwidth}
\fi
```

Then adjust the frame column structure accordingly in the `\begin{document}` section.

### Custom Dimensions

To use different poster dimensions, modify the beamerposter package lines in the Packages section:

```latex
\ifVerticalPoster
  \usepackage[size=custom,width=84.1,height=118.9,scale=1.0]{beamerposter}
\else
  \usepackage[size=custom,width=118.9,height=84.1,scale=1.0]{beamerposter}
\fi
```

Common standard poster sizes:
- 36" × 48" (vertical)
- 48" × 36" (horizontal)
- 84.1" × 118.9" (vertical, SIPB)

### Example Frame Structures

#### Horizontal (3 columns) - DEFAULT
```latex
\begin{columns}[t]
\separatorcolumn
\begin{column}{\colwidth}
  % Column 1 content
\end{column}
\separatorcolumn
\begin{column}{\colwidth}
  % Column 2 content
\end{column}
\separatorcolumn
\begin{column}{\colwidth}
  % Column 3 content
\end{column}
\separatorcolumn
\end{columns}
```

#### Vertical (1 column) - SINGLE COLUMN
```latex
\begin{columns}[t]
\separatorcolumn
\begin{column}{\colwidth}
  % Full-width content
\end{column}
\separatorcolumn
\end{columns}
```

#### Vertical (2 columns) - BALANCED
```latex
\begin{columns}[t]
\separatorcolumn
\begin{column}{\colwidth}
  % Column 1 content
\end{column}
\separatorcolumn
\begin{column}{\colwidth}
  % Column 2 content
\end{column}
\separatorcolumn
\end{columns}
```

### Troubleshooting Orientation Issues

**Compilation fails after switching orientation:**
- Ensure `\VerticalPostertrue` or `\VerticalPosterfalse` is set BEFORE `\documentclass`
- These must be at the very top of `poster.tex`

**Layout looks wrong:**
- Verify that the frame column structure matches your configured layout (1, 2, or 3 columns)
- For vertical mode with 1 column, remove extra `\separatorcolumn` commands
- Ensure `\colwidth` and `\sepwidth` settings match the column count

**Fonts or spacing look odd:**
- Different orientations may require different text scaling
- Adjust font sizes in `beamerthemegemini.sty` if needed
- Use `\scalefont{}` for fine-tuning specific elements

## FAQ

See the [FAQ] in the Wiki for answers to frequently asked questions such as how to add an institution logo to the poster.

## Color Themes

This template includes several color themes from Gemini, and it's easy to make your own. Built-in themes include:

- `gemini`, default
- `mit` ([Massachusetts Institute of Technology](https://mit.edu))
- `labsix` ([LabSix](https://www.labsix.org/))

### Community Themes

The community has also contributed additional themes:

<!-- keep these in sorted order by theme name -->

- `beluga` (based on Beamer's `whale` colortheme)
- `bristol` ([University of Bristol](https://www.bristol.ac.uk/))
- `czu` ([Czech University of Life Sciences](https://www.czu.cz/))
- `dart` ([Dartmouth College](https://dartmouth.edu))
- `iitgn` ([Indian Institute of Technology Gandhinagar](https://iitgn.ac.in/))
- `snu` ([Seoul National University](https://snu.ac.kr))
- `soton` ([University of Southampton](https://southampton.ac.uk/))
- `stetson` ([Stetson University](https://stetson.edu))
- `umich` ([University of Michigan](https://umich.edu/))
- `warwick` ([University of Warwick](https://warwick.ac.uk/))

To use a theme, copy `beamercolortheme[theme].sty` and update the `\usecolortheme` line in `poster.tex`.

## Design Goals

- **Minimal**: clean and easy to read, so that the emphasis is on the content
- **Batteries included**: works and looks good out of the box
- **Easy theming**: easy to create and use a new color theme
- **Flexible orientations**: seamlessly switch between vertical and horizontal layouts

## Contributing

Contributions such as bug reports, new themes, and new poster components are greatly appreciated! Given the subjective nature of design, you're encouraged to open an issue or pull request early to get feedback before investing a lot of time in implementing a new feature.

## License

Based on Gemini theme by Anish Athalye. Orientation switching added for personal use. Released under the MIT License. See [LICENSE.md][license] for details.

[beamerposter]: https://github.com/deselaers/latex-beamerposter
[Auriga]: https://github.com/anishathalye/auriga
[LuaTeX]: http://www.luatex.org/
[CTAN]: https://ctan.org/
[Raleway]: https://www.fontsquirrel.com/fonts/raleway
[Lato]: https://www.fontsquirrel.com/fonts/lato
[license]: LICENSE.md
[FAQ]: https://github.com/anishathalye/gemini/wiki/FAQ
