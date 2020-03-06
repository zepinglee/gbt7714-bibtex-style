#!/usr/bin/env texlua

module = "gbt7714"

testfiledir = "./test/testfiles"
testsuppdir = testfiledir .. "/support"

installfiles = {"*.sty", "*.bst"}
tagfiles = {"*.dtx", "*.ins", "CHANGELOG.md", "variants/*.ins"}
textfiles = {"*.md", "LICENSE"}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
    "build",
    "test/config-chapterbib",
}

typesetexe = "xelatex"
unpackexe = "xetex"

checkruns = 3

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

packtdszip = true

tdslocations = {
  "bibtex/bst/gbt7714/*.bst",
  "tex/latex/gbt7714/*.sty",
}

changeslisting = nil
do
  local f = assert(io.open("CHANGELOG.md", "r"))
  changeslisting = f:read("*all")
  f:close()
end
pkgversion = string.match(changeslisting, "## %[(v%S+)%] - ")

uploadconfig = {
  author      = "Zeping Lee",
  license     = "lppl1.3c",
  version     = pkgversion,
  summary     = "BibTeX implementation of Chinese bibliography style standard GB/T 7714-2015",
  topic       = {"bibtex-supp", "chinese"},
  ctanPath    = "/biblio/bibtex/contrib/gbt7714",
  repository  = "https://github.com/CTeX-org/gbt7714-bibtex-style",
  bugtracker  = "https://github.com/CTeX-org/gbt7714-bibtex-style/issues",
  update      = true,
  description = [[
The package provides a BibTeX implementation for the Chinese national bibliography style standard GB/T 7714-2015. It consists of two bst files for numerical and author-year styles and a LaTeX package which provides the citation style defined in the standard. It also support automatic language recognization (Chinese and English) for each biblilography entry and is designed to be fully compatible with natbib.
  ]],
}

lvtext = ".tex"

function runtest_tasks(name)
  return "bibtex -terse " .. name
end

function update_tag(file, content, tagname, tagdate)
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  local url = "https://github.com/CTeX-org/gbt7714-bibtex-style"
  local date = string.gsub(tagdate, "%-", "/")
  if string.match(file, "%.dtx$") or string.match(file, "%.ins$") then
    return string.gsub(content, "%d%d%d%d/%d%d/%d%d v[%d.]+",
      date .. " " .. tagname)
  elseif string.match(file, "CHANGELOG.md") then
    local previous = string.match(content, "/compare/(.*)%.%.%.HEAD")
    if tagname == previous then return content end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [" .. tagname .."] - " .. tagdate)
    return string.gsub(content,
      previous .. "%.%.%.HEAD",
      tagname .. "...HEAD\n[" .. tagname .. "]: " .. url .. "/compare/"
        .. previous .. "..." .. tagname)
  end
  return content
end
