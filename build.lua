#!/usr/bin/env texlua

module = "gbt7714"

testfiledir = "./test/testfiles"
testsuppdir = testfiledir .. "/support"

-- sourcefiles = {"*.dtx", "*.sty"}
installfiles = {"*.sty", "*.bst"}
tagfiles = {"*.dtx", "*.ins", "CHANGELOG.md", "variants/*.ins"}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
    "build",
    "test/config-chapterbib",
    "test/config-bibunits",
}

typesetexe = "xelatex"
unpackexe = "xetex"

checkruns = 3

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

local f = assert(io.open("CHANGELOG.md", "r"))
local change_log_content = f:read("*all")
f:close()
local pkg_version = string.match(change_log_content, "## %[v([%d%.]+)%] - ")
print(string.format("Package version: %s", pkg_version))

uploadconfig = {
  version           = pkg_version,
  author            = "Zeping Lee",
  license           = "lppl1.3c",
  uploader          = "Zeping Lee",
  email             = "zepinglee@gmail.com",
  summary           = "BibTeX implementation of China’s bibliography style standard GB/T 7714—2015",
  description       = [[The package provides a BibTeX implementation for the Chinese national bibliography style standard GB/T 7714—2015. It consists of two bst files for numerical and author-year styles as well as a LaTeX package which provides the citation style defined in the standard. The package is compatible with natbib and supports language detection (Chinese and English) for each biblilography entry.]],
  note              = "Uploaded automatically by l3build...",
  ctanPath          = "/biblio/bibtex/contrib/gbt7714",
  repository        = "https://github.com/zepinglee/gbt7714-bibtex-style",
  bugtracker        = "https://github.com/zepinglee/gbt7714-bibtex-style/issues",
  topic             = {"bibtex-sty", "chinese", "std-conform"},
  announcement_file = "ctan.ann",
  update            = true,
}

lvtext = ".tex"

function runtest_tasks(name, run)
  return "bibtex -terse " .. name
end

function update_tag(file, content, tagname, tagdate)
  tagname = string.gsub(tagname, "^v", "")

  if string.match(file,"CHANGELOG.md") then
    local pattern = "[%d%.]+"
    local url = "https://github.com/zepinglee/gbt7714-bibtex-style"
    local previous = string.match(content, "compare/v(" .. pattern .. ")%.%.%.HEAD")
    if tagname == previous then
      return content
    end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [v" .. tagname .."] - " .. tagdate)
    return string.gsub(content,
      "v" .. pattern .. "%.%.%.HEAD",
      "v" .. tagname .. "...HEAD\n[v" .. tagname .. "]: " .. url .. "/compare/v" .. previous
        .. "...v" .. tagname)
  else
    local date = string.gsub(tagdate, "%-", "/")
    return string.gsub(content, "%d%d%d%d/%d%d/%d%d v[%d.]+",
      date .. " v" .. tagname)
  end
  return content
end
