---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-chapterbib"
testsuppdir = testfiledir .. "/support"

checkruns = 3

function runtest_tasks(name)
  return "bibtex section1; bibtex section2"
end
