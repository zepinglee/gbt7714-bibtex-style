.PHONY : test testall save all bst doc clean cleanall install ctan FORCE_MAKE

NAME = gbt7714
PKGFILES = $(NAME).sty
BSTFILES = $(NAME)-numerical.bst $(NAME)-author-year.bst

TEXOPTS = -file-line-error -halt-on-error -interaction=nonstopmode
LATEXMK = latexmk -xelatex $(TEXOPTS)

testbst : bst
	bash test/check.sh

test: testbst
	l3build check

save :
	bash test/save.sh
	l3build save --quiet super
	l3build save --quiet numbers
	l3build save --quiet authoryear
	l3build save --quiet legacy-super
	l3build save --quiet legacy-numbers
	l3build save --quiet legacy-authoryear
	l3build save --config test/config-chapterbib package-chapterbib

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

ctan : test doc
	ln -sf . $(NAME)
	zip -r ../$(NAME).zip $(NAME)/{README.md,LICENSE,$(NAME).dtx,$(NAME).ins,\
	$(NAME).pdf,$(NAME).sty,$(NAME)-author-year.bst,$(NAME)-numerical.bst}
	rm $(NAME)
