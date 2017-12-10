.PHONY : test FORCE_MAKE

SHELL = bash

test : main.tex FORCE_MAKE
	latexmk -xelatex -halt-on-error -interaction=nonstopmode main
	cat intro.bbl > standard.bbl
	for i in {1..6}; do cat 4.$${i}.bbl >> standard.bbl; done;
	for i in {8,9.1,9.2,10.1,10.2}; do cat $${i}.bbl >> standard.bbl; done;
	for i in {1..10}; do cat a.$${i}.bbl >> standard.bbl; done;

clean :
	latexmk -c

distclean :
	latexmk -C
