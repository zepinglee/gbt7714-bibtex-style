---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

testfiledir = "./tests/testfiles-bbl"
supportdir = "."
checksuppfiles = {"*.bib"}

test_types = {
  bbl = {
    test = ".tex",
    reference = ".bbl",
    generated = ".bbl",
    rewrite = function(source, normalized, engine, errorcode)
      -- In this example we just copy the .bbl file without any normalization
      os.execute(string.format("cp %s %s", source, normalized))
    end,
  },
}

test_order = {"bbl"}

checkruns = 1

function runtest_tasks(name, run)
  return "bibtex " .. name
end
