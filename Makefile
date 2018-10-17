#Obviously it is your responsibility to make sure that everything
#is, in fact, in agreement with the most current NSF Grant 
#Proposal Guide and the respective Program's solicitation! 
#This is all provided `as-is' and no blame or responsibility
#for anything that went wrong will be taken.
#
#Good luck!

.PHONY: all main diff

all: main

main:
	pdflatex $@
	-bibtex $@ 
	pdflatex $@
	pdflatex $@ 
	@echo; echo
	#@check_repeats $@.tex
	./split.sh $@

diff:
	latexdiff v0.tex v1.tex > diff.tex
	pdflatex diff
	bibtex diff
	pdflatex diff
	pdflatex diff

clean: 
	rm -f *.spl *.dvi *.aux *.log *.bbl *.blg *.out *_*pdf
