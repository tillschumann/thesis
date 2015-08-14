# Makefile for latex documents

MFILE=port_params

all:
	pdflatex $(MFILE).tex
	pdflatex $(MFILE).tex
	pdflatex $(MFILE).tex

clean:
	rm -rf *~ *.log *.aux *.bbl *.blg *.idx *.ilg *.ind *.lof *.out *.pfg *.toc

mrproper: clean
	rm -rf *.pdf *.ps *.dvi 
