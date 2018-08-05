#!/usr/bin/env texlua

module = "gbt7714"

installfiles = {"gbt7714.sty", "gbt7714-plain.bst", "gbt7714-unsrt.bst"}
textfiles = {"README.md", "LICENSE"}
unpackfiles = {"*.dtx"}

typesetexe = "xelatex"
unpackexe = "xetex"

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
