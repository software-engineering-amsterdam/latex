tmp:
	pdflatex thesis
	bibtex thesis
	pdflatex -interaction=batchmode thesis
	pdflatex -interaction=batchmode thesis
	mv thesis.pdf ../documentation.pdf

all: *.tex paper.bib grammarware.bib Makefile
	pdflatex paper
	bibtex paper
	pdflatex -interaction=batchmode paper
	pdflatex -interaction=batchmode paper

grammarware.bib:
	cp ../../../work/web/bib/zaytsev.bib grammarware.bib

list:
	xsd2bgf ../../../slps/shared/xsd/cbgf.xsd cbgf.bgf
	bgf2bnf cbgf.bgf cbgf.bnf
	grep - cbgf.bnf | grep -v 'transformation' | grep -v '        ' | uniq | sort > cbgf.lst

clean:
	rm -f *~ *.bak *.aux *.log *.toc *.blg *.bbl *.dvi *.ps
	rm -f paper.pdf cbgf.bnf cbgf.lst
