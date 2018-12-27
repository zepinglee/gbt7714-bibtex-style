.PHONY : test standard FORCE_MAKE

STANDARD = standard
TEST = test

SHELL = bash
LATEXMK = latexmk -xelatex

test : $(TEST).pdf

standard : $(STANDARD).pdf

%.pdf : %.tex FORCE_MAKE
	TEXINPUTS="..:$${TEXINPUTS}" BSTINPUTS="..:$${BSTINPUTS}" $(LATEXMK) $<

clean :
	$(LATEXMK) -c

distclean :
	$(LATEXMK) -C
