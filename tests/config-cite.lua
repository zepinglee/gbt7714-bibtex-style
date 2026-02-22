---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-cite"
testsuppdir = testfiledir .. "/support"

-- checkengines = {"xetex"}
-- stdengine = "xetex"

checkopts = "-interaction=nonstopmode"
checkruns = 3

test_order = {"log"}
