$bibtex_use = 2;
$clean_ext = "nav snm";

# Use lualatex instead of pdflatex (required for fontspec in Gemini theme)
$pdflatex = 'lualatex -interaction=nonstopmode';
$pdf_mode = 1;  # Generate PDF using pdflatex (which we've aliased to lualatex)

# Add colorthemes directory to TeX search path
$ENV{'TEXINPUTS'} = './colorthemes//:' . ($ENV{'TEXINPUTS'} || '');
