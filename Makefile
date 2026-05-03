.PHONY : test testall save all bst doc clean cleanall install ctan FORCE_MAKE

NAME = gbt7714
BSTFILES = $(NAME)-numeric.bst $(NAME)-authoryear.bst

TEXOPTS = -file-line-error -halt-on-error
LATEXMK = latexmk -xelatex $(TEXOPTS)

testbst : bst
	l3build check --config build
	l3build check --config tests/config-variants

test : bst
	l3build check

savebst : bst
	bash tests/save.sh main
	bash tests/save.sh variants

save : bst
	bash tests/save.sh

all : test doc

bst : $(BSTFILES)

doc : $(NAME)-doc.pdf

%-numeric.bst %-authoryear.bst : %-bst.dtx variants/gbt7714-variants.ins
	xetex $(TEXOPTS) variants/gbt7714-variants.ins

$(NAME)-doc.pdf : $(NAME)-doc.tex FORCE_MAKE
	$(LATEXMK) $<

clean :
	l3build clean
	$(LATEXMK) -c $(NAME)-example.tex
	$(LATEXMK) -c $(NAME)-doc.tex

cleanall :
	l3build clean
	$(LATEXMK) -C $(NAME)-example.tex
	$(LATEXMK) -C $(NAME)-doc.tex

install :
	l3build install

ctan :
	l3build ctan
