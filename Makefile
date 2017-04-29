.PHONY : test diff bst doc clean all inst install distclean zip FORCE_MAKE

NAME = gbt-7714-2015
TEST_DIR = test
SHELL = bash
PWD   = $(shell pwd)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)

test : bst FORCE_MAKE
	make -C $(TESTDIR) test

diff : FORCE_MAKE
	diff test/standard.bbl test/tmp.bbl

all : test doc

bst : $(NAME).dtx
	xetex $<

doc : $(NAME).pdf

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	latexmk -xelatex $<

clean :
	latexmk -c $(NAME).dtx
	$(MAKE) -C $(TEST_DIR) distclean

distclean :
	latexmk -C $(NAME).dtx
	$(MAKE) -C $(TEST_DIR) distclean

inst : bst
	mkdir -p $(UTREE)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(UTREE)/bibtex/bst/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp $(NAME).sty $(UTREE)/tex/latex/$(NAME)
	cp *.bst $(UTREE)/bibtex/bst/$(NAME)

install : bst doc
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).sty $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/latex/$(NAME)

zip : bst doc
	ln -sf . $(NAME)
	zip -rq ../$(NAME).zip $(NAME)/{$(NAME).{dtx,pdf} ustc*.bst README.md \
	main.tex ustcextra.sty bib chapters figures .latexmkrc Makefile}
	rm $(NAME)
