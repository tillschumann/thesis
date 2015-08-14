# Makefile for latex documents

MFILE=transpose_via_mpi

all:
	pdflatex $(MFILE).tex
	bibtex $(MFILE)
	pdflatex $(MFILE).tex
	pdflatex $(MFILE).tex

clean:
	rm -rf *~ *.log *.aux *.bbl *.blg *.idx *.ilg *.ind *.lof *.out *.pfg *.toc

mrproper: clean
	rm -rf *.pdf *.ps *.dvi 
