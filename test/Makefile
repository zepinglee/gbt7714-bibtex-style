.PHONY : test FORCE_MAKE

test : test.tex FORCE_MAKE
	latexmk -xelatex test
	cat intro.bbl > tmp.bbl
	for i in {1..6}; do cat 1.$${i}.bbl >> tmp.bbl; done;
	for i in {2.1,2.2,3.1,3.2}; do cat $${i}.bbl >> tmp.bbl; done;
	for i in {1..10}; do cat a.$${i}.bbl >> tmp.bbl; done;

bbl : FORCE_MAKE
	for i in {1..6}; do cat 1.$${i}.bbl >> tmp.bbl; done;
	for i in {2.1,2.2,3.1,3.2}; do cat $${i}.bbl >> tmp.bbl; done;
	for i in {1..10}; do cat a.$${i}.bbl >> tmp.bbl; done;

clean :
	latexmk -c
	rm -f tmp.bbl

distclean :
	latexmk -C
	rm tmp.bbl
