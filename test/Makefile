.PHONY : test FORCE_MAKE

SHELL = bash

test : test.tex FORCE_MAKE
	latexmk -xelatex -halt-on-error -interaction=nonstopmode test
	cat intro.bbl > standard.bbl
	for i in {1..6}; do cat 1.$${i}.bbl >> standard.bbl; done;
	for i in {2.1,2.2,3.1,3.2}; do cat $${i}.bbl >> standard.bbl; done;
	for i in {1..10}; do cat a.$${i}.bbl >> standard.bbl; done;

clean :
	latexmk -c

distclean :
	latexmk -C
