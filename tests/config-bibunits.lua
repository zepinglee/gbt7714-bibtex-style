---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-bibunits"
testsuppdir = testfiledir .. "/support"

test_order = { "log" }

checkopts = "-file-line-error -interaction=nonstopmode"

checkruns = 3

function runtest_tasks(name, run)
  if run == 1 then
    return "bibtex -terse bu1; bibtex -terse bu2"
  else
    return ""
  end
end
