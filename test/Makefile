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
	cat intro.bbl > standard.txt
	for i in {1..6}; do cat 4.$${i}.bbl >> standard.txt; done;
	for i in {8,9.1,9.2,10.1,10.2}; do cat $${i}.bbl >> standard.txt; done;
	for i in {1..10}; do cat a.$${i}.bbl >> standard.txt; done;

clean :
	latexmk -c
	rm -f *.sty *.bst *.aux *.log *.bbl *.blg *.fls

distclean :
	latexmk -C
	rm -f *.sty *.bst *.aux *.log *.bbl *.blg *.fls
