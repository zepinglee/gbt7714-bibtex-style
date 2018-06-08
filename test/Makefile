.PHONY : test FORCE_MAKE

MAIN = main

SHELL = bash
LATEXMK = latexmk -xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1

STYFILES = gbt7714.sty

BSTFILES = gbt7714-plain.bst gbt7714-unsrt.bst

test : $(MAIN).pdf

%.bst : ../%.bst
	cp -f $< .

%.sty : ../%.sty
	cp -f $< .

$(MAIN).pdf : $(MAIN).tex $(STYFILES) $(BSTFILES) FORCE_MAKE
	$(LATEXMK) $<

clean :
	latexmk -c
	rm -f *.sty *.bst *.aux *.log *.blg *.fls

distclean :
	latexmk -C
	rm -f *.sty *.bst *.aux *.log *.blg *.fls
