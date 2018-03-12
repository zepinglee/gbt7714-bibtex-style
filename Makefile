.PHONY : test bst doc clean all inst install distclean zip FORCE_MAKE

NAME = gbt7714
PKGFILES = $(NAME).sty
BSTFILES = $(NAME)-plain.bst $(NAME)-unsrt.bst
TEST_DIR = test

SHELL = bash
LATEXMK = latexmk -xelatex -halt-on-error -interaction=nonstopmode
VERSION = $(shell cat $(NAME).dtx | egrep -o "\[\d\d\d\d/\d\d\/\d\d v.+\]" \
	  | egrep -o "v\S+")
TEXMF = $(shell kpsewhich --var-value TEXMFHOME)

test : inst FORCE_MAKE
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

inst : bst
	mkdir -p $(TEXMF)/tex/latex/$(NAME)
	mkdir -p $(TEXMF)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(TEXMF)/bibtex/bst/$(NAME)
	cp $(PKGFILES) $(TEXMF)/tex/latex/$(NAME)

install : bst doc
	mkdir -p $(TEXMF)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(TEXMF)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(TEXMF)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(TEXMF)/doc/latex/$(NAME)
	cp $(NAME).dtx $(TEXMF)/source/latex/$(NAME)
	cp $(PKGFILES) $(TEXMF)/tex/latex/$(NAME)

zip : bst doc
	ln -sf . $(NAME)
	zip -rq ../$(NAME).zip $(NAME)/{$(NAME).{dtx,pdf} ustc*.bst README.md \
	main.tex ustcextra.sty bib chapters figures .latexmkrc Makefile}
	rm $(NAME)
