testfiledir = "./test/testfiles-chapterbib"
testsuppdir = testfiledir .. "/support"

checkruns = 3

function runtest_tasks(name)
    return "bibtex -terse section1; bibtex -terse section2"
end
