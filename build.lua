#!/usr/bin/env texlua
---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

module = "gbt7714"

testfiledir = "./tests/testfiles"
testsuppdir = "./tests/support"
supportdir = "."
checksuppfiles = { "*-examples.bib" }

bibfiles = { "gbt7714-examples.bib" }
sourcefiles = { "*.dtx", "*.ins", "*.sty" }
installfiles = { "*.sty", "*.bst" }
tagfiles = {
  "CHANGELOG.md",
  "*.dtx",
  "*.ins",
  "*.sty",
  "*-doc.tex",
  "*.bst",
  "variants/*.ins",
  "variants/*.bst",
}
typesetdemofiles = { "*-example.tex" }
typesetfiles = { "*-doc.tex" }

-- includetests = {}

checkengines = { "xetex" }
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

unpackopts = "-file-line-error -interaction=batchmode"
checkopts = "-file-line-error -interaction=nonstopmode"
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

test_order = { "bbl" }

local version_pattern = "[%d.]+[%l%d.-]*"

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
  summary = "A BibTeX implementation of Chinese National Standard GB/T 7714",
  description =
  [[The gbt7714 package provides a comprehensive and configurable BibTeX implementation of the Chinese National Standard GB/T 7714, “Information and documentation---Rules for bibliographic references and citations to information resources.” The BibTeX styles included in the package support both numeric and author-year citation systems, and are fully compatible with the natbib package for advanced citation commands and formatting. These styles are designed to automatically detect the language (Chinese or English) of each bibliographic entry and apply the appropriate localization. Additionally, the package exposes a range of configuration options, allowing users to easily adapt the output to the requirements of specific academic journals or institutions.]],
  ctanPath = "/biblio/bibtex/contrib/gbt7714",
  repository = package_repository,
  bugtracker = package_repository .. "/issues",
  topic = { "bibtex-supp", "chinese", "std-conform" },
  update = true,
}

function runtest_tasks(name, run)
  if run == 1 then
    return "bibtex -terse " .. name
  else
    return ""
  end
end

function update_tag(file, content, tagname, tagdate)
  local version = string.gsub(tagname, "^v", "")

  content = string.gsub(content,
    "Copyright %([Cc]%) (%d%d%d%d)%-+%d%d%d%d",
    "Copyright (C) %1-" .. os.date("%Y"))

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
  elseif string.match(file, "%.sty$") then
    content = string.gsub(content,
      "\\ProvidesExplPackage {gbt7714} {%d%d%d%d%-%d%d%-%d%d} {" .. version_pattern .. "}",
      "\\ProvidesExplPackage {gbt7714} {" .. tagdate .. "} {" .. version .. "}")
  elseif string.match(file, "%.ins$") or string.match(file, "%.bst$") then
    content = string.gsub(content, "%d%d%d%d%-%d%d%-%d%d v" .. version_pattern,
      tagdate .. " v" .. version)
  end
  return content
end
