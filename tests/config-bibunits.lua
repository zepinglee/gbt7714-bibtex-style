---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-bibunits"
testsuppdir = testfiledir .. "/support"

checkruns = 3

function runtest_tasks(name)
  return "bibtex bu1; bibtex bu2"
end
