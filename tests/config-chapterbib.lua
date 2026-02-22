---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-chapterbib"
testsuppdir = testfiledir .. "/support"

test_order = {"log"}
checkruns = 3

function runtest_tasks(name)
  return "bibtex -terse chapter1; bibtex -terse chapter2"
end
