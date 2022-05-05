.PHONY : test testall save all bst doc clean cleanall install ctan FORCE_MAKE

NAME = gbt7714
PKGFILES = $(NAME).sty
BSTFILES = $(NAME)-numerical.bst $(NAME)-author-year.bst

TEXOPTS = -file-line-error -halt-on-error -interaction=nonstopmode
LATEXMK = latexmk -xelatex $(TEXOPTS)

testbst : bst
	bash test/test.sh

test: testbst
	l3build check

savebst:
	bash test/test.sh

save : savebst
	l3build save --quiet super
	l3build save --quiet numbers
	l3build save --quiet author-year
	l3build save --config test/config-chapterbib package-chapterbib
	l3build save --config test/config-bibunits package-bibunits

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
	zip -r ../$(NAME).zip $(NAME)/{$(NAME)-*.bst,$(NAME).sty,$(NAME).pdf,README.md,\
	CHANGELOG.md}
	rm $(NAME)
