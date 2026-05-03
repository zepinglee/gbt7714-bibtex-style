---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-cite"
testsuppdir = testfiledir .. "/support"

test_order = { "log" }

checkopts = "-file-line-error -interaction=nonstopmode"

checkruns = 3

function runtest_tasks(name, run)
  if run == 1 then
    return "bibtex -terse " .. name
  else
    return ""
  end
end
