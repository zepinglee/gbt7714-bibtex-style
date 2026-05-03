testfiledir = "./test/testfiles-bibunits"
testsuppdir = testfiledir .. "/support"

checkruns = 3

function runtest_tasks(name)
    return "bibtex -terse bu1; bibtex -terse bu2"
end
