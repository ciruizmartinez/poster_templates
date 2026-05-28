# Poster Orientation Guide

## Quick Start

Your `poster.tex` file now supports switching between **vertical** and **horizontal** poster orientations.

### Using Horizontal Orientation (Default)

The poster is already set to horizontal by default. No changes needed.

**Dimensions:** 118.9" wide × 84.1" tall  
**Layout:** 3 columns with automatic spacing

### Using Vertical Orientation

To switch to a vertical poster:

1. Open `poster.tex`
2. Go to the very top of the file (lines 4-10)
3. Find this section:
   ```latex
   % Set default to horizontal
   \newif\ifVerticalPoster
   \VerticalPosterfalse
   ```

4. Change `\VerticalPosterfalse` to `\VerticalPostertrue`:
   ```latex
   % Set default to vertical
   \newif\ifVerticalPoster
   \VerticalPostertrue
   ```

5. Save the file and rebuild with `make`

**Dimensions:** 84.1" wide × 118.9" tall  
**Layout:** 1 column (auto-adjusted width: 0.9\paperwidth)

## What Happens Automatically

When you toggle the orientation, the following adjustments happen **automatically**:

### Dimensions
- **Horizontal:** width=118.9", height=84.1"
- **Vertical:** width=84.1", height=118.9"

### Column Layout
- **Horizontal:** 3 columns @ 0.3\paperwidth each, with 0.025\paperwidth margins
- **Vertical:** 1 column @ 0.9\paperwidth wide, with 0.05\paperwidth margins

## Advanced: Customizing Column Layout

If you want a different column layout (e.g., 2 columns for vertical), you can manually adjust:

### For Vertical with 2 Columns
Edit the "Lengths" section (around line 42):

```latex
\ifVerticalPoster
  % Vertical: 2 column layout (example)
  \setlength{\sepwidth}{0.025\paperwidth}
  \setlength{\colwidth}{0.45\paperwidth}
  % (2+1)*0.025 + 2*0.45 = 0.075 + 0.9 = 0.975 ≈ 1.0
\else
  ...
```

And in the frame content, you'll need to adjust the number of columns accordingly.

## Common Dimensions

For reference, here are some standard poster sizes you might want to use:

| Size | Width | Height | Orientation |
|------|-------|--------|-------------|
| SIPB | 84.1" | 118.9" | Vertical |
| Standard | 36" | 48" | Vertical |
| Standard | 48" | 36" | Horizontal |

To use different dimensions, modify the `\usepackage[size=custom,...]` lines in the Packages section.

## Troubleshooting

### Compilation fails after switching orientation
- Make sure you're setting `\VerticalPostertrue` or `\VerticalPosterfalse` at the TOP of the file
- These must be set BEFORE the `\documentclass` line
- The line numbers mentioned are approximate; look for the "ORIENTATION SETTING" comment

### Layout looks wrong
- For vertical mode, you may need to remove some `\separatorcolumn` commands in the frame
- The default vertical layout assumes 1 column; if you want more, adjust both the lengths AND the frame column structure

### Fonts or spacing looks odd
- Different orientations may require different scaling of text
- Consider using `\scalefont` or adjusting font sizes in `beamerthemegemini.sty` for vertical layouts

## Example Frame Structures

### Horizontal (3 columns) - DEFAULT
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

### Vertical (1 column) - SIMPLIFIED
```latex
\begin{columns}[t]
\separatorcolumn
\begin{column}{\colwidth}
  % Full-width content
\end{column}
\separatorcolumn
\end{columns}
```

### Vertical (2 columns) - BALANCED
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

(Note: Adjust `\colwidth` and `\sepwidth` in the Lengths section accordingly)
