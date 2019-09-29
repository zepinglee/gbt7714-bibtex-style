#!/usr/bin/env texlua

module = "gbt7714"

installfiles = {"*.sty", "*.bst"}
textfiles = {"README.md", "LICENSE"}

checkengines = {"xetex"}
stdengine = "xetex"

typesetexe = "xelatex"
unpackexe = "xetex"

checkruns = 3

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

lvtext = ".tex"

function runtest_tasks(name)
    return "bibtex -terse " .. name
end
