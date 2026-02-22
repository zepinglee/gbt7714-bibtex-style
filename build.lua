#!/usr/bin/env texlua
---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

module = "gbt7714"

testfiledir = "./tests/testfiles"
testsuppdir = "./tests/support"
supportdir = "."
checksuppfiles = {"*-examples.bib"}

sourcefiles = {"*.dtx", "*.ins", "*.sty"}
installfiles = {"*.sty", "*.bst"}
tagfiles = {
  "CHANGELOG.md",
  "*.dtx",
  "*.ins",
  "*.sty",
  "*-doc.tex",
  "*.bst",
  "variants/*.ins",
}
typesetdemofiles = {"*-example.tex"}
typesetfiles = {"*-doc.tex"}

-- includetests = {}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
  "build",
  "tests/config-cite",
  "tests/config-chapterbib",
  "tests/config-bibunits",
}

typesetexe = "xelatex"
unpackexe = "xetex"
bibtexexe = "bibtex"

unpackopts = "-interaction=batchmode"
checkopts = "-interaction=batchmode"
bibtexopts = ""

checkruns = 1

local function get_blg_message(blg_path)
  local blg_file = assert(io.open(blg_path, "rb"))
  local blg_content = blg_file:read("a")
  io.close(blg_file)
  local messages = {}
  for line in blg_content:gmatch("[^\r\n]+") do
    if line:find("^Warning--")
        or line:find("^Error--")
        or line:find("%d+ warning")
        or line:find("[Ee]rror") then
      table.insert(messages, "% " .. line)
    end
  end
  return table.concat(messages, "\n")
end

test_types = {
  bbl = {
    test = ".lvt",
    generated = ".bbl",
    reference = ".tlg",
    -- compare = compare_tlg,
    rewrite = function(source, result, engine, errlevels)
      local file = assert(io.open(source, "rb"))
      local content = string.gsub(file:read("a"), "\r\n", "\n")
      file:close()

      local new_content = content
      local blg_path = source:gsub("%.%w+$", ".blg")
      if fileexists(blg_path) then
        blg_message = get_blg_message(blg_path)
        if blg_message ~= "" then
          new_content = new_content .. "\n" .. blg_message .. "\n"
        end
      end

      local newfile = assert(io.open(result, "w"))
      io.output(newfile)
      io.write(new_content)
      io.close(newfile)
    end,
  },
}

test_order = {"bbl"}

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
