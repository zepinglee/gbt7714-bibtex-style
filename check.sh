testfiledir="testbst"
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


succuss=true;
echo "Running checks on";

for file in $testfiledir/*.bib; do
    filename=$(basename $file);
    testname=$(basename $filename .bib);
    echo "  $testname";

    options=${testname//-/,};
    content="\\input docstrip.tex
\\keepsilent
\\askforoverwritefalse
\\nopostamble
\\generate{\\file{test.bst}{\\from{gbt7714.dtx}{$options}}}
\\endbatchfile";
    echo "$content" > "$unpackdir/unpack.ins";

    ( cd "$unpackdir"; $unpackexe unpack.ins > /dev/null; )
    cp -f "$unpackdir/test.bst" "$testdir"

    content="\\relax
\\bibstyle{test}
\\citation{*}
\\bibdata{standard,$testname}";
    echo "$content" > "$testdir/test.aux";

    cp -f "$file" "$testdir";  # test bib file

    ( cd $testdir; $bibtexexe test > /dev/null; )

    bblfile="$testdir/test.bbl";
    stdfile="$testfiledir/$testname.bbl";
    if ! diff -q "$bblfile" "$stdfile"; then
        echo "fails";
        succuss=false;
        cp -f "$bblfile" "$stdfile";
    fi
done

if $succuss; then
    echo "";
    echo "All checks passed";
    echo "";
else
    exit 1;
fi
