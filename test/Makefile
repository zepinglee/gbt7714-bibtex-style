.PHONY : test FORCE_MAKE

MAIN = main

SHELL = bash
LATEXMK = latexmk -xelatex

test : $(MAIN).pdf

$(MAIN).pdf : $(MAIN).tex FORCE_MAKE
	TEXINPUTS="..:$${TEXINPUTS}" BSTINPUTS="..:$${BSTINPUTS}" $(LATEXMK) $<

clean :
	$(LATEXMK) -c $(MAIN).tex
	rm -f *.aux *.blg *.fls *.log

distclean :
	$(LATEXMK) -C $(MAIN).tex
	rm -f *.aux *.blg *.fls *.log
