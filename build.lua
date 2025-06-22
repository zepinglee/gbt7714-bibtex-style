#!/usr/bin/env texlua
---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

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

local version_pattern = "[%d%l.-]+"

local f = assert(io.open("CHANGELOG.md", "r"))
local changelog_content = f:read("*all")
f:close()
local package_version, package_date = string.match(changelog_content,
  "## %[(" .. version_pattern .. ")%] %- (%d%d%d%d%-%d%d%-%d%d)")

local ok, mydata = pcall(require, "zepingleedata.lua")
if not ok then
  mydata = {}
end

local package_repository = "https://github.com/zepinglee/gbt7714-bibtex-style"

uploadconfig = {
  version = package_version .. " " .. package_date,
  author = "Zeping Lee",
  license = "lppl1.3c",
  uploader = mydata.name or "Zeping Lee",
  email = mydata.email,
  summary = "BibTeX implementation of China’s bibliography style standard GB/T 7714—2015",
  description =
  [[The package provides a BibTeX implementation for the Chinese national bibliography style standard GB/T 7714—2015. It consists of two bst files for numerical and author-year styles as well as a LaTeX package which provides the citation style defined in the standard. The package is compatible with natbib and supports language detection (Chinese and English) for each biblilography entry.]],
  ctanPath = "/biblio/bibtex/contrib/gbt7714",
  repository = package_repository,
  bugtracker = package_repository .. "/issues",
  topic = {"bibtex-sty", "chinese", "std-conform"},
  update = true,
}

lvtext = ".tex"

function runtest_tasks(name)
  return "bibtex -terse " .. name
end

function update_tag(file, content, tagname, tagdate)
  local version = string.gsub(tagname, "^v", "")
  local date = string.gsub(tagdate, "%-", "/")

  content = string.gsub(content,
    "Copyright %([Cc]%) (%d%d%d%d)%-+%d%d%d%d",
    "Copyright (c) %1-" .. os.date("%Y"))

  if file == "CHANGELOG.md" then
    local previous = string.match(content, "/compare/v(" .. version_pattern .. ")%.%.%.HEAD")
    if version ~= previous then
      content = string.gsub(content,
        "## %[Unreleased%]",
        "## [Unreleased]\n\n## [" .. version .. "] - " .. tagdate)
      content = string.gsub(content,
        "v" .. version_pattern .. "%.%.%.HEAD",
        "v" .. version .. "...HEAD\n[" .. version .. "]: " .. package_repository .. "/compare/v" .. previous
        .. "...v" .. version)
    end

  elseif string.match(file, "%.dtx$") or string.match(file, "%.ins$") then
    content = string.gsub(content, "%d%d%d%d/%d%d/%d%d v" .. version_pattern,
      date .. " v" .. version)
  end
  return content
end
