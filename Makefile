job = $(shell basename $(CURDIR))

all: 
	pdflatex -jobname=$(job) main.tex	
show: 
	evince $(job).pdf &	
