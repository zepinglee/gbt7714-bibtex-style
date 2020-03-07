testfiledir="test/testbst"
testsuppdir="$testfiledir/support"
unpackdir="build/unpacked";
testdir="build/test";
texoptions="-file-line-error -halt-on-error -interaction=nonstopmode"
unpackexe="xetex $texoptions"
checkexe="xelatex $texoptions -no-pdf"
bibtexexe="bibtex"


if [ ! -d "$unpackdir" ]; then
    mkdir -p "$unpackdir";
fi
cp -f "gbt7714.dtx" "$unpackdir";


if [ ! -d "$testdir" ]; then
    mkdir -p "$testdir";
fi
cp -f "$testfiledir/support/test.aux" "$testdir";
cp -f "$testfiledir/support/standard.bib" "$testdir";


echo "Saving bbl";

for file in $testfiledir/*.dtx; do
    filename=$(basename $file);
    testname=$(basename $filename .dtx);
    echo "  $testname";

    cp -f "$file" "$unpackdir";  # test bib file

    ( cd "$unpackdir"; $unpackexe $filename > /dev/null; )
    cp -f "$unpackdir/test.bst" "$testdir"
    cp -f "$unpackdir/test.bib" "$testdir"

    ( cd $testdir; $bibtexexe test > /dev/null; )

    bblfile="$testdir/test.bbl";
    stdfile="$testfiledir/$testname.bbl";
    if ! diff -q "$bblfile" "$stdfile" > /dev/null; then
        cp -f "$bblfile" "$stdfile";
    fi
done
