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
cp -f "$testfiledir/support/standard.bib" "$testdir";


if [ -z "$1" ]; then
    fails=0;
    echo "Running checks on";

    for file in $testfiledir/*.dtx; do
        filename=$(basename $file);
        testname=$(basename $filename .dtx);
        echo "  $testname";

        cp -f "$file" "$unpackdir";  # test bib file

        ( cd "$unpackdir"; $unpackexe $filename > /dev/null; )
        cp -f "$unpackdir/test.aux" "$testdir"
        cp -f "$unpackdir/test.bst" "$testdir"
        cp -f "$unpackdir/test.bib" "$testdir"

        ( cd $testdir;
        if ! $bibtexexe test > /dev/null; then
            $bibtexexe test | head -n 20;
            echo "";
        fi )

        bblfile="$testdir/test.bbl";
        stdfile="$testfiledir/$testname.bbl";
        if ! diff -q "$bblfile" "$stdfile" > /dev/null 2> /dev/null; then
            echo "    differs";
            cp -f "$bblfile" "$stdfile";
            fails=$((fails+1));
        fi
    done

    echo "";
    if [ $fails == 0 ]; then
        echo "All checks passed";
        echo "";
    fi
    exit $fails;

else
    cp -f "$testfiledir/support/test.tex" "$testdir";
    cp -f "gbt7714.sty" "$testdir";
    testname="$1";
    filename="$testname.dtx";
    file="$testfiledir/$testname.dtx";

    cp -f "$file" "$unpackdir";  # test bib file

    ( cd "$unpackdir"; $unpackexe $filename; )
    cp -f "$unpackdir/test.aux" "$testdir";
    cp -f "$unpackdir/test.bst" "$testdir";
    cp -f "$unpackdir/test.bib" "$testdir";

    ( cd "$testdir"; latexmk -xelatex test; )

    bblfile="$testdir/test.bbl";
    stdfile="$testfiledir/$testname.bbl";
    if ! diff -q "$bblfile" "$stdfile" > /dev/null; then
        cp -f "$bblfile" "$stdfile";
    fi
fi
