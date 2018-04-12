.PHONY : test bst doc clean all inst install distclean zip FORCE_MAKE

NAME = gbt7714
PKGFILES = $(NAME).sty
BSTFILES = $(NAME)-plain.bst $(NAME)-unsrt.bst
TEST_DIR = test

SHELL = bash
LATEXMK = latexmk -xelatex -file-line-error -halt-on-error -interaction=nonstopmode
VERSION = $(shell cat $(NAME).dtx | egrep -o "\[\d\d\d\d/\d\d\/\d\d v.+\]" \
	  | egrep -o "v\S+")
TEXMFHOME = $(shell kpsewhich --var-value TEXMFHOME)

test : bst FORCE_MAKE
	$(MAKE) -C $(TESTDIR) test

all : test doc

bst : $(PKGFILES) $(BSTFILES)

doc : $(NAME).pdf

$(PKGFILES) $(BSTFILES) : $(NAME).dtx
	xetex $<

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	$(LATEXMK) -xelatex -halt-on-error -interaction=nonstopmode $<

clean :
	$(LATEXMK) -c $(NAME).dtx
	$(MAKE) -C $(TEST_DIR) clean

distclean :
	$(LATEXMK) -C $(NAME).dtx
	$(MAKE) -C $(TEST_DIR) distclean

install : bst doc
	mkdir -p $(TEXMFHOME)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(TEXMFHOME)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(TEXMFHOME)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(TEXMFHOME)/doc/latex/$(NAME)
	cp $(NAME).dtx $(TEXMFHOME)/source/latex/$(NAME)
	cp $(PKGFILES) $(TEXMFHOME)/tex/latex/$(NAME)

zip : bst doc
	ln -sf . $(NAME)
	zip ../$(NAME).zip $(NAME)/{README.md,$(NAME){.dtx,.pdf,.sty,-plain.bst,-unsrt.bst}}
	rm $(NAME)
