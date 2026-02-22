---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-bibunits"
testsuppdir = testfiledir .. "/support"

test_order = {"log"}
checkruns = 3

function runtest_tasks(name)
  return "bibtex -terse bu1; bibtex -terse bu2"
end
