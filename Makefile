# Default command-line utilities 
VIEWER = evince
TEXCOMPILER = pdflatex

# Parameterization of various directory & filenames
JOB = $(shell basename $(CURDIR))
TEXS = $(shell find $(CURDIR) -type f -name '*.tex')
ENTRYTEX = main.tex

# Default recipe: show pdf, recompiling if sources have changed.
$(JOB) : $(JOB).pdf
	$(VIEWER) $< &

# Compile the pdf output using the TeX compiler and the given TeX 
# entrypoint file stored in $(ENTRYTEX). Any *.tex file, occuring 
# at arbitrary depths relative to the local directory, is taken as
# a prerequisite of this rule.
$(JOB).pdf : $(TEXS)
	$(TEXCOMPILER) -jobname=$(JOB) $(ENTRYTEX)	

# Show PDF without recompilation.
.PHONY: show
show: 
	$(VIEWER) $(JOB).pdf &	
