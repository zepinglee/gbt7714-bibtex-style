.PHONY : test testall save all bst doc clean cleanall install ctan FORCE_MAKE

NAME = gbt7714
PKGFILES = $(NAME).sty
BSTFILES = $(NAME)-plain.bst $(NAME)-unsrt.bst

TEXOPTS = -file-line-error -halt-on-error -interaction=nonstopmode
LATEXMK = latexmk -xelatex $(TEXOPTS)

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

%.sty %-plain.bst %-unsrt.bst : %.ins %.dtx
	xetex $(TEXOPTS) $<

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	$(LATEXMK) $<

clean :
	$(LATEXMK) -c $(NAME).dtx
	l3build clean

cleanall :
	$(LATEXMK) -C $(NAME).dtx
	l3build clean

install :
	l3build install

ctan :
	l3build ctan
