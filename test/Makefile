.PHONY : test FORCE_MAKE

MAIN = main

SHELL = bash
LATEXMK =  latexmk -xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1

test : $(MAIN).pdf

$(MAIN).pdf : $(MAIN).tex FORCE_MAKE
	TEXINPUTS="..:$${TEXINPUTS}" BSTINPUTS="..:$${BSTINPUTS}" $(LATEXMK) $<

clean :
	latexmk -c
	rm -f *.aux *.blg *.fls *.log

distclean :
	latexmk -C
	rm -f *.aux *.blg *.fls *.log
