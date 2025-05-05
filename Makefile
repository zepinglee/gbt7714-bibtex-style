.PHONY : test testall save all bst doc clean cleanall install ctan FORCE_MAKE

NAME = gbt7714
PKGFILES = $(NAME).sty
BSTFILES = $(NAME)-numerical.bst $(NAME)-author-year.bst

TEXOPTS = -file-line-error -halt-on-error -interaction=nonstopmode
LATEXMK = latexmk -xelatex $(TEXOPTS)

savebst : bst
	bash tests/save.sh bbl

testbst : bst
	l3build check --config tests/config-bbl

save : bst
	bash tests/save.sh

test : bst
	l3build check

all : test doc

bst : $(PKGFILES) $(BSTFILES)

doc : $(NAME).pdf

%.sty %-numerical.bst %-author-year.bst : %.ins %.dtx
	xetex $(TEXOPTS) $<
	xetex $(TEXOPTS) variants/gbt7714-variants.ins

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
