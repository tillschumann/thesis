# Makefile for latex documents

MFILE=doc

all:
	pdflatex $(MFILE).tex
	pdflatex $(MFILE).tex
	pdflatex $(MFILE).tex

clean:
	rm -rf *~ *.log *.aux *.bbl *.blg *.idx *.ilg *.ind *.lof *.out *.pfg *.toc *-eps-converted-to.pdf

mrproper: clean
	rm -rf *.pdf *.ps *.dvi 
