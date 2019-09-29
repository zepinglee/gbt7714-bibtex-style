.PHONY : test testall save all bst doc clean cleanall install ctan FORCE_MAKE

NAME = gbt7714
PKGFILES = $(NAME).sty
BSTFILES = $(NAME)-plain.bst $(NAME)-unsrt.bst

SHELL = bash
LATEXMK = latexmk -xelatex -file-line-error -halt-on-error -interaction=nonstopmode
VERSION = $(shell cat $(NAME).dtx | egrep -o "\[\d\d\d\d/\d\d\/\d\d v.+\]" \
	  | egrep -o "v\S+")
TEXMF = $(shell kpsewhich --var-value TEXMFHOME)

test : bst
	bash check.sh

testall : test
	l3build check

save :
	bash check.sh
	l3build save --quiet super
	l3build save --quiet numbers
	l3build save --quiet authoryear

all : test doc

bst : $(PKGFILES) $(BSTFILES)

doc : $(NAME).pdf

%.sty %-plain.bst %-unsrt.bst : %.dtx
	xetex $<

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	$(LATEXMK) -xelatex -halt-on-error -interaction=nonstopmode $<

clean :
	$(LATEXMK) -c $(NAME).dtx
	l3build clean

cleanall :
	$(LATEXMK) -C $(NAME).dtx
	l3build clean

install : bst doc
	mkdir -p $(TEXMF)/{doc,source,tex}/latex/$(NAME)
	mkdir -p $(TEXMF)/bibtex/bst/$(NAME)
	cp $(BSTFILES) $(TEXMF)/bibtex/bst/$(NAME)
	cp $(NAME).pdf $(TEXMF)/doc/latex/$(NAME)
	cp $(NAME).dtx $(TEXMF)/source/latex/$(NAME)
	cp $(PKGFILES) $(TEXMF)/tex/latex/$(NAME)

ctan : bst doc
	ln -sf . $(NAME)
	zip -r ../$(NAME).zip $(NAME)/{README.md,LICENSE,$(NAME).dtx,\
	$(NAME).pdf,$(NAME).sty,$(NAME)-plain.bst,$(NAME)-unsrt.bst}
	rm $(NAME)
