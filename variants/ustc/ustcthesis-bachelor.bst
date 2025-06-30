%%
%% This is file `variants/ustc/ustcthesis-bachelor.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% gbt7714.dtx  (with options: `2015,ustc,numerical')
%% -------------------------------------------------------------------
%% GB/T 7714 BibTeX Style
%% https://github.com/zepinglee/gbt7714-bibtex-style
%% Version: 2025/06/22 v2.1.8
%% -------------------------------------------------------------------
%% Copyright (C) 2016--2025 by Zeping Lee <zepinglee AT gmail.com>
%% -------------------------------------------------------------------
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% -------------------------------------------------------------------
INTEGERS {
  max.bib.names
  min.bib.names
  max.cite.names
  min.cite.names
  family.uppercase
  year.before.title
  italic.book.title
  sentence.case.title
  sentence.case.journal
  sentence.case.booktitle
  link.title
  control.article.title
  control.patent.country
  control.entry.type.id
  control.space.before.type.id
  control.entry.medium.id
  short.journal
  italic.journal
  link.journal
  bold.journal.volume
  show.missing.address.publisher
  space.before.pages
  only.start.page
  show.urldate
  show.url
  show.doi
  show.preprint
  show.note
  show.english.translation
  end.with.period
  lowercase.word.after.colon
}

STRINGS {
  cite.lang
  name.year.delim
  control.component.part.delim
  page.range.delimiter
}

FUNCTION {load.config}
{
  #3 'max.bib.names :=
  #3 'min.bib.names :=
  #1 'max.cite.names :=
  #1 'min.cite.names :=
  #0 'family.uppercase :=
  "auto" 'cite.lang :=
  #0 'year.before.title :=
  "period" 'name.year.delim :=
  #0 'italic.book.title :=
  #1 'sentence.case.title :=
  #1 'sentence.case.journal :=
  #1 'sentence.case.booktitle :=
  #0 'link.title :=
  #1 'control.article.title :=
  #0 'control.patent.country :=
  #1 'control.entry.type.id :=
  #0 'control.space.before.type.id :=
  #1 'control.entry.medium.id :=
  "slash" 'control.component.part.delim :=
  #0 'short.journal :=
  #0 'italic.journal :=
  #0 'link.journal :=
  #0 'bold.journal.volume :=
  #0 'show.missing.address.publisher :=
  #1 'space.before.pages :=
  #0 'only.start.page :=
  "-" 'page.range.delimiter :=
  #1 'show.urldate :=
  #0 'show.url :=
  #0 'show.doi :=
  #1 'show.preprint :=
  #0 'show.note :=
  #0 'show.english.translation :=
  #1 'end.with.period :=
  #1 'lowercase.word.after.colon :=
}

ENTRY
  { address
    archivePrefix
    author
    booktitle
    country  % 专利国别
    date
    doi
    edition
    editor
    eprint
    eprinttype
    entrysubtype
    entrytypeid
    entrymediumid
    howpublished
    institution
    journal
    journaltitle
    key
    langid
    language
    location
    mark
    medium
    nationality  % 专利国别，兼容 IEEEtran.bst
    note
    number
    organization
    pages
    publisher
    school
    series
    shortjournal
    title
    translation
    translator
    url
    urldate
    volume
    year
    CTL_max_bib_names
    CTL_min_bib_names
    CTL_max_cite_names
    CTL_min_cite_names
    CTL_family_uppercase
    CTL_cite_lang
    CTL_year_before_title
    CTL_name_year_delim
    CTL_italic_book_title
    CTL_sentence_case_title
    CTL_sentence_case_journal
    CTL_sentence_case_booktitle
    CTL_article_title
    CTL_patent_country
    CTL_entry_type_id
    CTL_space_before_type_id
    CTL_entry_medium_id
    CTL_component_part_delim
  }
  { entry.lang entry.is.electronic is.pure.electronic entry.numbered }
  { label extra.label sort.label short.list entry.type.id entry.url }

INTEGERS { output.state before.all mid.sentence after.sentence after.block after.slash }

INTEGERS { lang.zh lang.ja lang.en lang.ru lang.other }

INTEGERS { charptr len }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.slash :=
  #3 'lang.zh :=
  #4 'lang.ja :=
  #1 'lang.en :=
  #2 'lang.ru :=
  #0 'lang.other :=
}

FUNCTION {bbl.anonymous}
{ entry.lang lang.zh =
    { "佚名" }
    { "Anon" }
  if$
}

FUNCTION {bbl.space}
{ entry.lang lang.zh =
    { "\ " }
    { " " }
  if$
}

FUNCTION {bbl.and}
{ "" }

FUNCTION {bbl.et.al}
{ entry.lang lang.zh =
    { "等" }
    { entry.lang lang.ja =
        { "ほか" }
        { entry.lang lang.ru =
            { "и др." }
            { "et~al." }
          if$
        }
      if$
    }
  if$
}

FUNCTION {citation.and}
{ cite.lang "auto" =
    { entry.lang lang.zh =
        { "和" }
        { entry.lang lang.ja =
            { "と" }
            { entry.lang lang.ru =
                { "и" }
                { "and" }
              if$
            }
          if$
        }
      if$
    }
    { cite.lang "macro" =
        { "{\biband}" }
        { cite.lang "chinese" =
            { "和" }
            { "and" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {citation.et.al}
{ cite.lang "auto" =
    { bbl.et.al }
    { cite.lang "macro" =
        { "{\bibetal}" }
        { cite.lang "chinese" =
            { "等" }
            { "et~al." }
          if$
        }
      if$
    }
  if$
}

FUNCTION {bbl.colon} { ": " }

FUNCTION {bbl.pages.colon}
{ space.before.pages
    { ": " }
    { ":\allowbreak " }
  if$
}

FUNCTION {bbl.wide.space} { "\quad " }

FUNCTION {bbl.slash} { "//\allowbreak " }

FUNCTION {bbl.sine.loco}
{ entry.lang lang.zh =
    { "[出版地不详]" }
    { "[S.l.]" }
  if$
}

FUNCTION {bbl.sine.nomine}
{ entry.lang lang.zh =
    { "[出版者不详]" }
    { "[s.n.]" }
  if$
}

FUNCTION {bbl.sine.loco.sine.nomine}
{ entry.lang lang.zh =
    { "[出版地不详: 出版者不详]" }
    { "[S.l.: s.n.]" }
  if$
}

FUNCTION {default.self.tokens} { ":,-'–—?.!" }

FUNCTION {latin.upper} { "ÀÁÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞŸĀĂĄĆĈĊČĎĐĒĔĖĘĚĜĞĠĢĤĦĨĪĬĮİIĴĶĹĻĽĿŁŃŅŇŊŌŎŐŒŔŖŘŚŜŞŠŢŤŦŨŪŬŮŰŲŴŶŸŹŻŽ" }

FUNCTION {latin.lower} { "àáãäåæçèéêëìíîïðñòóôõöøùúûüýþÿāăąćĉċčďđēĕėęěĝğġģĥħĩīĭįiıĵķĺļľŀłńņňŋōŏőœŕŗřśŝşšţťŧũūŭůűųŵŷÿźżž" }

FUNCTION {range.delimiters} { "-–—～" }

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

STRINGS { x y }

FUNCTION {contains}
{ 'y :=
  'x :=
  y text.length$ 'len :=
  x text.length$ len - #1 + 'charptr :=
    { charptr #0 >
      x charptr len substring$ y = not
      and
    }
    { charptr #1 - 'charptr := }
  while$
  charptr #0 >
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { output.state after.slash =
                { bbl.slash * write$
                  newline$
                }
                { add.period$ " " * write$ }
              if$
            }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.after}
{ 't :=
  duplicate$ empty$
    'pop$
    { 's :=
      output.state mid.sentence =
        { t * write$ }
        { output.state after.block =
            { add.period$ write$
              newline$
              "\newblock " write$
            }
            { output.state before.all =
                'write$
                { output.state after.slash =
                    { bbl.slash * write$ }
                    { add.period$ " " * write$ }
                  if$
                }
              if$
            }
          if$
          mid.sentence 'output.state :=
        }
      if$
      s
    }
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ end.with.period
    'add.period$
    'skip$
  if$
  write$
  show.english.translation entry.lang lang.zh = and
    { ")"
      write$
    }
    'skip$
  if$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { output.state after.slash =
        'skip$
        { after.block 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { output.state after.slash =
            'skip$
            { after.sentence 'output.state := }
          if$
        }
      if$
    }
  if$
}

FUNCTION {new.slash}
{ output.state before.all =
    'skip$
    { control.component.part.delim "slash" =
        { after.slash 'output.state := }
        { new.block
          control.component.part.delim "in" =
            { entry.lang lang.en =
                { "In: " output
                  write$
                  ""
                  before.all 'output.state :=
                }
                'skip$
              if$
            }
            'skip$
          if$
        }
      if$
    }
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

INTEGERS { b }

FUNCTION {is.int.in.range}
{
  'b :=
  #1 +
  b >
    { #1 - b < }
    { pop$ #0 }
  if$
}

FUNCTION {mult.power2}
{
  { duplicate$ #0 > }
    {
      swap$
      duplicate$ +
      swap$ #1 -
    }
  while$
  pop$
}

FUNCTION {find.match.brace}
{
  's :=
  't :=

  #1
  { duplicate$ #0 >
    s empty$ not and }
    {
      s #1 #1 substring$ "{" =
        { #1 + }
        {
          s #1 #1 substring$ "}" =
            { #1 - }
            'skip$
          if$
        }
      if$
      t s #1 #1 substring$ * 't :=
      s #2 global.max$ substring$ 's :=
    }
  while$

  duplicate$ #0 >
    {
      "Unbalanced brace(s): one or more closing braces are missing" warning$
      { duplicate$ #0 > }
        {
          t "}" * 't :=
          #1 -
        }
      while$
    }
    'skip$
  if$
  pop$

  t
  s
}

FUNCTION {split.first.char.from.str}
{
  duplicate$ "" =
    {
      "split.first.char.from.str: Trying to split an empty string!" warning$
      ""
    }
    {
      duplicate$ #1 #1 substring$ chr.to.int$ #128 <
        {
          duplicate$ #1 #1 substring$ swap$
          #2 global.max$ substring$ swap$
        }
        {
          duplicate$ #1 #1 substring$ chr.to.int$ #224 <
            {
              duplicate$ #1 #2 substring$ swap$
              #3 global.max$ substring$ swap$
            }
            {
              duplicate$ #1 #1 substring$ chr.to.int$ #240 <
                {
                  duplicate$ #1 #3 substring$ swap$
                  #4 global.max$ substring$ swap$
                }
                {
                  duplicate$ #1 #4 substring$ swap$
                  #5 global.max$ substring$ swap$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {get.first.char.from.str}
{
  split.first.char.from.str swap$ pop$
}

FUNCTION {split.first.tex.char.from.str}
{
  duplicate$ #1 #1 substring$ "{" =
    {
      split.first.char.from.str swap$
      find.match.brace swap$
    }
    'split.first.char.from.str
  if$
}

FUNCTION {char.to.unicode}
{
  duplicate$ #4 #1 substring$ "" =
    {
      duplicate$ #3 #1 substring$ "" =
        {
          duplicate$ #2 #1 substring$ "" =
            {
              duplicate$ "" =
                {
                  "Empty string is not a char!" warning$
                  pop$ #-1
                }
                { #1 #1 substring$ chr.to.int$ }
              if$
            }
            {
              duplicate$ #2 #1 substring$ chr.to.int$ #128 - swap$
              #1 #1 substring$ chr.to.int$ #192 -
              #6 mult.power2 +
            }
          if$
        }
        {
          duplicate$ #3 #1 substring$ chr.to.int$ #128 - swap$
          duplicate$ #2 #1 substring$ chr.to.int$ #128 - swap$
          #1 #1 substring$ chr.to.int$ #224 -
          #6 mult.power2 +
          #6 mult.power2 +
        }
      if$
    }
    {
      duplicate$ #4 #1 substring$ chr.to.int$ #128 - swap$
      duplicate$ #3 #1 substring$ chr.to.int$ #128 - swap$
      duplicate$ #2 #1 substring$ chr.to.int$ #128 - swap$
      #1 #1 substring$ chr.to.int$ #240 -
      #6 mult.power2 +
      #6 mult.power2 +
      #6 mult.power2 +
    }
  if$
}

FUNCTION {is.char.in.str}
{
  't :=

  t "" =
    { "is.char.in.str: Empty string is not a char!" warning$ }
    'skip$
  if$

  #0 swap$
  { duplicate$ "" = not }
    {
      split.first.char.from.str t =
        { pop$ pop$ #1 "" }
        'skip$
      if$
    }
  while$
  pop$
}

FUNCTION {is.upper.ascii}
{
  char.to.unicode #65 swap$ #90 swap$ is.int.in.range
}

FUNCTION {is.upper}
{
  duplicate$ is.upper.ascii
    { pop$ #1 }
    { latin.upper swap$ is.char.in.str }
  if$
}

FUNCTION {is.lower.ascii}
{
  char.to.unicode #97 swap$ #122 swap$ is.int.in.range
}

FUNCTION {is.lower}
{
  duplicate$ is.lower.ascii
    { pop$ #1 }
    { latin.lower swap$ is.char.in.str }
  if$
}

FUNCTION {is.printable.ascii}
{
  char.to.unicode #32 swap$ #126 swap$ is.int.in.range
}

FUNCTION {is.letter.ascii}
{
  duplicate$ is.upper.ascii swap$ is.lower.ascii or
}

FUNCTION {is.symbol.ascii}
{
  duplicate$ is.printable.ascii swap$ is.letter.ascii not and
}

FUNCTION {is.all.lower}
{
  #1 swap$
  { duplicate$ "" = not }
    {
      split.first.char.from.str is.lower
        'skip$
        { pop$ pop$ #0 "" }
      if$
    }
  while$
  pop$
}

FUNCTION {is.tex.str.in.title.case}
{
  duplicate$ "" =
    { pop$ #0 }
    {
      split.first.tex.char.from.str purify$
      duplicate$ "" =
        { pop$ pop$ #0 }
        {
          split.first.char.from.str is.upper
            {
              duplicate$ is.all.lower
                {
                  empty$
                    {
                      duplicate$ "" =
                        { pop$ #0 }
                        'is.all.lower
                      if$
                    }
                    'is.all.lower
                  if$
                }
                { pop$ pop$ #0 }
              if$
            }
            { pop$ pop$ #0}
          if$
        }
      if$
    }
  if$
}

FUNCTION {is.in.inter.token.chars}
{
  duplicate$ #0 =
    { pop$ " " = }
    {
      #1 =
        { " " range.delimiters * swap$ is.char.in.str }
        'is.letter.ascii
      if$
    }
  if$
}

FUNCTION {skip.inter.token.chars.by}
{
  'b :=
  't :=

  "" t
  { duplicate$ "" = not }
    {
      split.first.char.from.str
      duplicate$ b is.in.inter.token.chars
        { swap$ 't := * t }
        { swap$ * 't := "" }
      if$
    }
  while$

  pop$ t
}

FUNCTION {skip.inter.token.chars}
{
  #0 skip.inter.token.chars.by
}

FUNCTION {skip.inter.token.command}
{
  duplicate$ "" =
    { "" }
    {
      duplicate$ #1 #1 substring$ is.symbol.ascii
        { split.first.char.from.str swap$ }
        { #2 skip.inter.token.chars.by }
     if$
    }
  if$
}

FUNCTION {is.special.char.command}
{
  #2 global.max$ substring$ skip.inter.token.command

  empty$
    'skip$
    { "is.special.char.command: cmdstr has extra components!" warning$ }
  if$

  duplicate$ duplicate$ duplicate$ duplicate$ duplicate$ duplicate$
  "oOlLij" swap$ is.char.in.str
  swap$ "oe" = or
  swap$ "OE" = or
  swap$ "ae" = or
  swap$ "AE" = or
  swap$ "aa" = or
  swap$ "AA" = or
}

FUNCTION {map.char}
{
  't :=
  split.first.char.from.str
  { swap$ duplicate$ "" = not }
    {
      swap$ t =
        { pop$ "" t }
        {
          swap$ split.first.char.from.str pop$ swap$
          split.first.char.from.str
        }
      if$
    }
  while$
  pop$ t =
    'get.first.char.from.str
    { pop$ t }
  if$
}

FUNCTION {to.lower}
{
  duplicate$ is.upper.ascii
    { chr.to.int$ #32 + int.to.chr$ }
    { latin.lower swap$ latin.upper swap$ map.char }
  if$
}

FUNCTION {to.upper}
{
  duplicate$ is.lower.ascii
    { chr.to.int$ #32 - int.to.chr$ }
    { latin.upper swap$ latin.lower swap$ map.char }
  if$
}

FUNCTION {all.to.lower}
{
  "" swap$
  { duplicate$ empty$ not }
    { split.first.char.from.str to.lower swap$ 't := * t }
  while$
  *
}

FUNCTION {command.to.lower}
{
  duplicate$ "" =
    { "command.to.lower: Empty string is not a texchar!" warning$ }
    {
      duplicate$ #1 #1 substring$ #92 int.to.chr$ =
        {
          duplicate$ is.special.char.command
            'all.to.lower
            'skip$
          if$
        }
        'to.lower
      if$
    }
  if$
}

FUNCTION {tex.to.lower}
{
  duplicate$ #1 #2 substring$ "{" #92 int.to.chr$ * =
    {
      "" swap$
      { duplicate$ "" = not }
        {
          split.first.char.from.str
          duplicate$ #92 int.to.chr$ =
            {
              swap$ skip.inter.token.command 't := * t
              swap$ command.to.lower
            }
            'to.lower
          if$
          swap$ 't := * t
        }
      while$
      pop$
    }
    {
      duplicate$ #1 #1 substring$ "{" =
        { split.first.char.from.str swap$ find.match.brace pop$ }
        'command.to.lower
      if$
    }
  if$
}

FUNCTION {all.to.upper}
{
  "" swap$
  { duplicate$ empty$ not }
    { split.first.char.from.str to.upper swap$ 't := * t }
  while$
  *
}

FUNCTION {command.to.upper}
{
  duplicate$ "" =
    { "command.to.lower: Empty string is not a texchar!" warning$ }
    {
      duplicate$ #1 #1 substring$ #92 int.to.chr$ =
        {
           duplicate$ is.special.char.command
             'all.to.upper
             'skip$
           if$
        }
        'to.upper
      if$
    }
  if$
}

FUNCTION {tex.to.upper}
{
  duplicate$ #1 #2 substring$ "{" #92 int.to.chr$ * =
    {
      "" swap$
      { duplicate$ "" = not }
      {
        split.first.char.from.str
        duplicate$ #92 int.to.chr$ =
          {
            swap$ skip.inter.token.command 't := * t
            swap$ command.to.upper
          }
          'to.upper
        if$
        swap$ 't := * t
      }
      while$
      pop$
    }
    {
      duplicate$ #1 #1 substring$ "{" =
        { split.first.char.from.str swap$ find.match.brace pop$ }
        'command.to.upper
      if$
    }
  if$
}

FUNCTION {lower.token.if.in.title.case}
{
  duplicate$ is.tex.str.in.title.case
    { split.first.tex.char.from.str tex.to.lower swap$ * }
    'skip$
  if$
}

FUNCTION {self.tokens}
{
  #0 =
    'default.self.tokens
    'range.delimiters
  if$
}

FUNCTION {tokenize.by}
{
  'b :=
  's :=

  s "" =
    { "" "" }
    {
      s split.first.char.from.str
      duplicate$ b self.tokens swap$ is.char.in.str
        'swap$
        {
          duplicate$ #92 int.to.chr$ =
            { swap$ skip.inter.token.command 's := * s }
            {
              pop$ pop$ "" s
              { duplicate$ "" = not }
                {
                  split.first.char.from.str
                  duplicate$ "\ " b self.tokens * swap$ is.char.in.str
                    { pop$ pop$ "" }
                    {
                      duplicate$ "{" =
                        { swap$ find.match.brace }
                        'swap$
                      if$
                      's := * s
                    }
                  if$
                }
              while$
              pop$ s
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {tokenize}
{
  #0 tokenize.by
}

FUNCTION {smart.sentence.case}
{
  tokenize 's :=

  { s "" = not }
    {
      s skip.inter.token.chars 's := * s
      tokenize swap$
      duplicate$ ":" =
        {
          swap$ 's := *
          s skip.inter.token.chars 's := * s
          tokenize swap$
          lowercase.word.after.colon
            {
              duplicate$ "A" =
                { pop$ "a" }
                'lower.token.if.in.title.case
              if$
            }
            'skip$
          if$
        }
        'lower.token.if.in.title.case
      if$
      swap$ 's := *
    }
  while$
}

FUNCTION {smart.upper.case}
{
  s swap$ t swap$

  "" swap$
  { duplicate$ "" = not }
    {
      tokenize swap$
      duplicate$ #1 #1 substring$ #92 int.to.chr$ =
        'command.to.upper
        {
          "" swap$
          { duplicate$ "" = not }
            {
              split.first.tex.char.from.str tex.to.upper
              swap$ 't := * t
            }
          while$
          pop$
        }
      if$
      swap$ 't := * t
      skip.inter.token.chars 't := * t
    }
  while$
  pop$

  swap$ 't :=
  swap$ 's :=
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

FUNCTION {format.btitle}
{ italic.book.title
  entry.lang lang.en = and
    'emphasize
    'skip$
  if$
}

INTEGERS { byte second.byte }

INTEGERS { char.lang tmp.lang }

STRINGS { tmp.str }

FUNCTION {get.str.lang}
{ 'tmp.str :=
  lang.other 'tmp.lang :=
  #1 'charptr :=
  tmp.str text.length$ #1 + 'len :=
    { charptr len < }
    { tmp.str charptr #1 substring$ chr.to.int$ 'byte :=
      byte #128 <
        { charptr #1 + 'charptr :=
          byte #64 > byte #91 < and byte #96 > byte #123 < and or
            { lang.en 'char.lang := }
            { lang.other 'char.lang := }
          if$
        }
        { tmp.str charptr #1 + #1 substring$ chr.to.int$ 'second.byte :=
          byte #224 <
            { charptr #2 + 'charptr :=
              byte #207 > byte #212 < and
              byte #212 = second.byte #176 < and or
                { lang.ru 'char.lang := }
                { lang.other 'char.lang := }
              if$
            }
            { byte #240 <
                { charptr #3 + 'charptr :=
                  byte #227 > byte #234 < and
                    { lang.zh 'char.lang := }
                    { byte #227 =
                        { second.byte #143 >
                            { lang.zh 'char.lang := }
                            { second.byte #128 > second.byte #132 < and
                                { lang.ja 'char.lang := }
                                { lang.other 'char.lang := }
                              if$
                            }
                          if$
                        }
                        { byte #239 =
                          second.byte #163 > second.byte #172 < and and
                            { lang.zh 'char.lang := }
                            { lang.other 'char.lang := }
                          if$
                        }
                      if$
                    }
                  if$
                }
                { charptr #4 + 'charptr :=
                  byte #240 = second.byte #159 > and
                    { lang.zh 'char.lang := }
                    { lang.other 'char.lang := }
                  if$
                }
              if$
            }
          if$
        }
      if$
      char.lang tmp.lang >
        { char.lang 'tmp.lang := }
        'skip$
      if$
    }
  while$
  tmp.lang
}

FUNCTION {check.entry.lang}
{ author field.or.null
  title field.or.null *
  get.str.lang
}

STRINGS { entry.langid }

FUNCTION {set.entry.lang}
{ "" 'entry.langid :=
  language empty$ not
    { language 'entry.langid := }
    'skip$
  if$
  langid empty$ not
    { langid 'entry.langid := }
    'skip$
  if$
  entry.langid empty$
    { check.entry.lang }
    { entry.langid "english" = entry.langid "american" = or entry.langid "british" = or
        { lang.en }
        { entry.langid "chinese" =
            { lang.zh }
            { entry.langid "japanese" =
                { lang.ja }
                { entry.langid "russian" =
                    { lang.ru }
                    { check.entry.lang }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  'entry.lang :=
}

FUNCTION {set.entry.numbered}
{ type$ "patent" =
  type$ "standard" = or
  type$ "techreport" = or
    { #1 'entry.numbered := }
    { #0 'entry.numbered := }
  if$
}

INTEGERS { nameptr namesleft numnames name.lang }

FUNCTION {format.name}
{ "{vv~}{ll}{, jj}{, ff}" format.name$ duplicate$
  "others" =
    { pop$ bbl.et.al }
    { get.str.lang lang.en =
        { s nameptr "{vv~}{ll}" format.name$
          family.uppercase
            'smart.upper.case
            'skip$
          if$
          s nameptr "{ f{~}}{, jj}" format.name$ *
        }
        { s nameptr "{vv~}{ll}{ff}{, jj}" format.name$  }
      if$
    }
  if$
}

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  ""
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr format.name bbl.et.al =
      numnames max.bib.names > nameptr min.bib.names > and or
        { ", " *
          bbl.et.al *
          #1 'namesleft :=
        }
        { nameptr #1 >
            { namesleft #1 = bbl.and "" = not and
                { bbl.and * }
                { ", " * }
              if$
            }
            'skip$
          if$
          s nameptr format.name *
        }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author empty$ not
    { author format.names }
    { "empty author in " cite$ * warning$
      ""
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names }
  if$
}

FUNCTION {format.translators}
{ translator empty$
    { "" }
    { translator format.names
      entry.lang lang.zh =
        { translator num.names$ #3 >
            { "译" * }
            { ", 译" * }
          if$
        }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.full.names}
{'s :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, ff}" format.name$ 't :=
      t get.str.lang 'name.lang :=
      name.lang lang.en =
        { t #1 "{vv~}{ll}" format.name$ 't := }
        { t #1 "{ll}{ff}" format.name$ 't := }
      if$
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              numnames #2 >
                { "," * }
                'skip$
              if$
              t "others" =
                { " et~al." * }
                { " and " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.full}
{ author empty$
    { editor empty$
        { "" }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.full}
{ author empty$
    { "" }
    { author format.full.names }
  if$
}

FUNCTION {editor.full}
{ editor empty$
    { "" }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" = booktitle empty$ not and
  or
    'author.editor.full
    { type$ "collection" =
      type$ "proceedings" =
      or
        'editor.full
        'author.full
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label ")" *
  make.full.names duplicate$ short.list =
    { pop$ }
    { duplicate$ "]" contains
        { "{" swap$ * "}" * }
        'skip$
      if$
      *
    }
  if$
  "]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {change.sentence.case}
{ entry.lang lang.en =
    'smart.sentence.case
    'skip$
  if$
}

FUNCTION {add.link}
{ url empty$ not
    { "\href{" url * "}{" * swap$ * "}" * }
    { doi empty$ not
        { "\href{https://doi.org/" doi * "}{" * swap$ * "}" * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title
      sentence.case.title
        'change.sentence.case
        'skip$
      if$
      entry.numbered number empty$ not and
        { bbl.colon *
          type$ "patent" = control.patent.country and
            { country empty$ not
                { country * ", " * }
                { nationality empty$ not
                    { nationality * ", " * }
                    { address empty$ not
                        { address * ", " * }
                        { location empty$ not
                            { location * ", " * }
                            { entry.lang lang.zh =
                                { "中国" * ", " * }
                                'skip$
                              if$
                            }
                          if$
                        }
                      if$
                    }
                  if$
                }
              if$
            }
            'skip$
          if$
          number *
        }
        'skip$
      if$
      link.title
        'add.link
        'skip$
      if$
    }
  if$
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {is.digit}
{ duplicate$ empty$
    { pop$ #0 }
    { chr.to.int$
      duplicate$ "0" chr.to.int$ <
      { pop$ #0 }
      { "9" chr.to.int$ >
          { #0 }
          { #1 }
        if$
      }
    if$
    }
  if$
}

FUNCTION {is.number}
{ 's :=
  s empty$
    { #0 }
    { s text.length$ 'charptr :=
        { charptr #0 >
          s charptr #1 substring$ is.digit
          and
        }
        { charptr #1 - 'charptr := }
      while$
      charptr not
    }
  if$
}

FUNCTION {format.volume}
{ volume empty$ not
    { volume is.number
        { entry.lang lang.zh =
            { "第 " volume * " 卷" * }
            { "Vol." volume tie.or.space.connect }
          if$
        }
        { volume }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.number}
{ number empty$ not
    { number is.number
        { entry.lang lang.zh =
            { "第 " number * " 册" * }
            { "No." number tie.or.space.connect }
          if$
        }
        { number }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.volume.number}
{ volume empty$ not
    { format.volume }
    { format.number }
  if$
}

FUNCTION {format.title.vol.num}
{ title
  sentence.case.title
    'change.sentence.case
    'skip$
  if$
  entry.numbered
    { number empty$ not
        { bbl.colon * number * }
        'skip$
      if$
    }
    { format.volume.number 's :=
      s empty$ not
        { bbl.colon * s * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.series.vol.num.title}
{ format.volume.number 's :=
  series empty$ not
    { series
      sentence.case.title
        'change.sentence.case
        'skip$
      if$
      entry.numbered
        { bbl.wide.space * }
        { bbl.colon *
          s empty$ not
            { s * bbl.wide.space * }
            'skip$
          if$
        }
      if$
      title *
      sentence.case.title
        'change.sentence.case
        'skip$
      if$
      entry.numbered number empty$ not and
        { bbl.colon * number * }
        'skip$
      if$
    }
    { format.title.vol.num }
  if$
  format.btitle
  link.title
    'add.link
    'skip$
  if$
}

FUNCTION {format.booktitle.vol.num}
{ booktitle
  sentence.case.booktitle
    'change.sentence.case
    'skip$
  if$
  entry.numbered
    'skip$
    { format.volume.number 's :=
      s empty$ not
        { bbl.colon * s * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.series.vol.num.booktitle}
{ format.volume.number 's :=
  series empty$ not
    { series bbl.colon *
      entry.numbered not s empty$ not and
        { s * bbl.wide.space * }
        'skip$
      if$
      booktitle
      sentence.case.booktitle
        'change.sentence.case
        'skip$
      if$
      *
    }
    { format.booktitle.vol.num }
  if$
  format.btitle
}

FUNCTION {remove.period}
{ 't :=
  "" 's :=
    { t empty$ not }
    { t #1 #1 substring$ 'tmp.str :=
      tmp.str "." = not
        { s tmp.str * 's := }
        'skip$
      if$
      t #2 global.max$ substring$ 't :=
    }
  while$
  s
}

FUNCTION {abbreviate}
{ remove.period
  't :=
  t "l" change.case$ 's :=
  ""
  s "physical review letters" =
    { "Phys Rev Lett" }
    'skip$
  if$
  's :=
  s empty$
    { t }
    { pop$ s }
  if$
}

FUNCTION {get.journal.title}
{ short.journal
    { shortjournal empty$ not
        { shortjournal }
        { journal empty$ not
            { journal abbreviate }
            { journaltitle empty$ not
                { journaltitle abbreviate }
                { "" }
              if$
            }
          if$
        }
      if$
    }
    { journal empty$ not
        { journal }
        { journaltitle empty$ not
            { journaltitle }
            { shortjournal empty$ not
                { shortjournal }
                { "" }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {check.arxiv.preprint}
{ #1 #5 substring$ purify$ "l" change.case$ "arxiv" =
    { #1 }
    { #0 }
  if$
}

FUNCTION {format.journal}
{ get.journal.title
  duplicate$ empty$ not
    { italic.journal entry.lang lang.en = and
        'emphasize
        'skip$
      if$
      sentence.case.journal
        'change.sentence.case
        'skip$
      if$
      link.journal
        'add.link
        'skip$
      if$
    }
    'skip$
  if$
}

FUNCTION {set.entry.type.id}
{ entry.type.id empty$ not
    'pop$
    { entrytypeid empty$ not
        { pop$ entrytypeid 'entry.type.id := }
        { mark empty$ not
            { pop$
              "The field 'mark' for entry type ID is deprecated. Use 'entrytypeid' instead." warning$
              mark 'entry.type.id :=
            }
            { 'entry.type.id := }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.entry.type.id}
{ control.entry.type.id
    { entry.type.id
      control.entry.medium.id
        { entrymediumid empty$ not
            { "/" * entrymediumid * }
            { medium empty$ not
                { "The field 'medium' for entry medium ID is deprecated. Use 'entrymediumid' instead." warning$
                  "/" * medium *
                }
                { entry.is.electronic
                    { "/OL" * }
                    'skip$
                  if$
                }
              if$
            }
          if$
        }
        'skip$
      if$
      'entry.type.id :=
      control.space.before.type.id
        { " " }
        { "\allowbreak" }
      if$
      "[" * entry.type.id * "]" *
    }
    { "" }
  if$
}

FUNCTION {num.to.ordinal}
{ duplicate$ text.length$ 'charptr :=
  duplicate$ charptr #1 substring$ 's :=
  s "1" =
    { "st" * }
    { s "2" =
        { "nd" * }
        { s "3" =
            { "rd" * }
            { "th" * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition is.number
        { edition "1" = not
            { entry.lang lang.zh =
                { edition " 版" * }
                { edition num.to.ordinal " ed." * }
              if$
            }
            'skip$
          if$
        }
        { entry.lang lang.en =
            { edition change.sentence.case 's :=
              s "Revised" = s "Revised edition" = or
                { "Rev. ed." }
                { s " ed." * }
              if$
            }
            { edition }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.publisher}
{ publisher empty$ not
    { publisher }
    { school empty$ not
        { school }
        { organization empty$ not
            { organization }
            { institution empty$ not
                { institution }
                { "" }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.address.publisher}
{ address empty$ not
    { address }
    { location empty$ not
        { location }
        { "" }
      if$
    }
  if$
  duplicate$ empty$ not
    { format.publisher empty$ not
        { bbl.colon * format.publisher * }
        { entry.is.electronic not show.missing.address.publisher and
            { bbl.colon * bbl.sine.nomine * }
            'skip$
          if$
        }
      if$
    }
    { pop$
      entry.is.electronic not show.missing.address.publisher and
        { format.publisher empty$ not
            { bbl.sine.loco bbl.colon * format.publisher * }
            { bbl.sine.loco.sine.nomine }
          if$
        }
        { format.publisher empty$ not
            { format.publisher }
            { "" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {extract.before.dash}
{ duplicate$ empty$
    { pop$ "" }
    { 's :=
      #1 'charptr :=
      s text.length$ #1 + 'len :=
        { charptr len <
          s charptr #1 substring$ "-" = not
          and
        }
        { charptr #1 + 'charptr := }
      while$
      s #1 charptr #1 - substring$
    }
  if$
}

FUNCTION {extract.after.dash}
{ duplicate$ empty$
    { pop$ "" }
    { 's :=
      #1 'charptr :=
      s text.length$ #1 + 'len :=
        { charptr len <
          s charptr #1 substring$ "-" = not
          and
        }
        { charptr #1 + 'charptr := }
      while$
        { charptr len <
          s charptr #1 substring$ "-" =
          and
        }
        { charptr #1 + 'charptr := }
      while$
      s charptr global.max$ substring$
    }
  if$
}

FUNCTION {extract.before.slash}
{ duplicate$ empty$
    { pop$ "" }
    { 's :=
      #1 'charptr :=
      s text.length$ #1 + 'len :=
        { charptr len <
          s charptr #1 substring$ "/" = not
          and
        }
        { charptr #1 + 'charptr := }
      while$
      s #1 charptr #1 - substring$
    }
  if$
}

FUNCTION {extract.after.slash}
{ duplicate$ empty$
    { pop$ "" }
    { 's :=
      #1 'charptr :=
      s text.length$ #1 + 'len :=
        { charptr len <
          s charptr #1 substring$ "-" = not
          and
          s charptr #1 substring$ "/" = not
          and
        }
        { charptr #1 + 'charptr := }
      while$
        { charptr len <
          s charptr #1 substring$ "-" =
          s charptr #1 substring$ "/" =
          or
          and
        }
        { charptr #1 + 'charptr := }
      while$
      s charptr global.max$ substring$
    }
  if$
}

FUNCTION {format.year}
{ year empty$ not
    { year extra.label * }
    { date empty$ not
        { date extract.before.dash extra.label * }
        { entry.is.electronic not
            { "empty year in " cite$ * warning$ }
            'skip$
          if$
          urldate empty$ not
            { "[" urldate extract.before.dash * extra.label * "]" * }
            { "" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.periodical.year}
{ year empty$ not
    { year extract.before.slash
      "--" *
      year extract.after.slash
      duplicate$ empty$
        'pop$
        { * }
      if$
    }
    { date empty$ not
        { date extract.before.dash }
        { "empty year in " cite$ * warning$
          urldate empty$ not
            { "[" urldate extract.before.dash * "]" * }
            { "" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.date}
{ date empty$ not
    { type$ "patent" = type$ "newspaper" = or
        { date }
        { entrysubtype empty$ not
            { type$ "article" = entrysubtype "newspaper" = and
                { date }
                { format.year }
              if$
            }
            { format.year }
          if$
        }
      if$
    }
    { year empty$ not
        { format.year }
        { "" }
      if$
    }
  if$
}

FUNCTION {format.editdate}
{ date empty$ not
    { "\allowbreak(" date * ")" * }
    { "" }
  if$
}

FUNCTION {format.urldate}
{ show.urldate show.url and entry.url empty$ not and
  is.pure.electronic or
  urldate empty$ not and
    { "\allowbreak[" urldate * "]" * }
    { "" }
  if$
}

FUNCTION {normalize.page.range}
{
  "" swap$
  { duplicate$ empty$ not }
    {
      #1 skip.inter.token.chars.by 't :=
      empty$
        { "" }
        'page.range.delimiter
      if$
      * t
      #1 tokenize.by 't :=
      * t
    }
  while$
  pop$
}

FUNCTION {format.pages}
{
  pages normalize.page.range
}

FUNCTION {format.extracted.pages}
{ pages empty$
    { "" }
    { pages
      only.start.page
        { #1 tokenize.by pop$ }
        'normalize.page.range
      if$
    }
  if$
}

FUNCTION {format.journal.volume}
{ volume empty$ not
    { bold.journal.volume
        { "\textbf{" volume * "}" * }
        { volume }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.journal.number}
{ number empty$ not
    { "\allowbreak (" number * ")" * }
    { "" }
  if$
}

FUNCTION {format.journal.pages}
{ pages empty$
    { "" }
    { format.extracted.pages }
  if$
}

FUNCTION {format.periodical.year.volume.number}
{ year empty$ not
    { year extract.before.slash }
    { "empty year in periodical " cite$ * warning$ }
  if$
  volume empty$ not
    { ", " * volume extract.before.dash * }
    'skip$
  if$
  number empty$ not
    { "\allowbreak (" * number extract.before.dash * ")" * }
    'skip$
  if$
  "--" *
  year extract.after.slash empty$
  volume extract.after.dash empty$ and
  number extract.after.dash empty$ and not
    { year extract.after.slash empty$ not
        { year extract.after.slash * }
        { year extract.before.slash * }
      if$
      volume empty$ not
        { ", " * volume extract.after.dash * }
        'skip$
      if$
      number empty$ not
        { "\allowbreak (" * number extract.after.dash * ")" * }
        'skip$
      if$
    }
    'skip$
  if$
}

FUNCTION {check.url}
{ url empty$ not
    { url 'entry.url :=
      #1 'entry.is.electronic :=
    }
    { howpublished empty$ not
        { howpublished #1 #5 substring$ "\url{" =
            { howpublished 'entry.url :=
              #1 'entry.is.electronic :=
            }
            'skip$
          if$
        }
        { note empty$ not
            { note #1 #5 substring$ "\url{" =
                { note 'entry.url :=
                  #1 'entry.is.electronic :=
                }
                'skip$
              if$
            }
            'skip$
          if$
        }
      if$
    }
  if$
}

FUNCTION {output.url}
{ show.url is.pure.electronic or
  entry.url empty$ not and
    { new.block
      entry.url #1 #5 substring$ "\url{" =
        { entry.url }
        { "\url{" entry.url * "}" * }
      if$
      output
    }
    'skip$
  if$
}

FUNCTION {check.doi}
{ doi empty$ not
    { #1 'entry.is.electronic := }
    'skip$
  if$
}

FUNCTION {is.in.url}
{ 's :=
  s empty$
    { #1 }
    { entry.url empty$
        { #0 }
        { s text.length$ 'len :=
          entry.url "l" change.case$ text.length$ 'charptr :=
            { entry.url "l" change.case$ charptr len substring$ s "l" change.case$ = not
              charptr #0 >
              and
            }
            { charptr #1 - 'charptr := }
          while$
          charptr
        }
      if$
    }
  if$
}

FUNCTION {format.doi}
{ ""
  doi empty$ not
    { "" 's :=
      doi 't :=
      #0 'numnames :=
        { t empty$ not}
        { t #1 #1 substring$ 'tmp.str :=
          tmp.str "," = tmp.str " " = or t #2 #1 substring$ empty$ or
            { t #2 #1 substring$ empty$
                { s tmp.str * 's := }
                'skip$
              if$
              s empty$ s is.in.url or
                'skip$
                { numnames #1 + 'numnames :=
                  numnames #1 >
                    { ", " * }
                    { "DOI: " * }
                  if$
                  "\doi{" s * "}" * *
                }
              if$
              "" 's :=
            }
            { s tmp.str * 's := }
          if$
          t #2 global.max$ substring$ 't :=
        }
      while$
    }
    'skip$
  if$
}

FUNCTION {output.doi}
{ doi empty$ not show.doi and
  show.english.translation entry.lang lang.zh = and not and
    { new.block
      format.doi output
    }
    'skip$
  if$
}

FUNCTION {check.electronic}
{ "" 'entry.url :=
  #0 'entry.is.electronic :=
    'check.doi
    'skip$
  if$
    'check.url
    'skip$
  if$
  medium empty$ not
    { medium "MT" = medium "DK" = or medium "CD" = or medium "OL" = or
        { #1 'entry.is.electronic := }
        'skip$
      if$
    }
    'skip$
  if$
}

FUNCTION {format.eprint}
{ archivePrefix empty$ not
    { archivePrefix }
    { eprinttype empty$ not
        { archivePrefix }
        { "" }
      if$
    }
  if$
  's :=
  s empty$ not
    { s ": \eprint{" *
      url empty$ not
        { url }
        { "https://" s "l" change.case$ * ".org/abs/" * eprint * }
      if$
      * "}{" *
      eprint * "}" *
    }
    { eprint }
  if$
}

FUNCTION {output.eprint}
{ show.preprint eprint empty$ not and
    { new.block
      format.eprint output
    }
    'skip$
  if$
}

FUNCTION {format.note}
{ note empty$ not show.note and
    { note }
    { "" }
  if$
}

FUNCTION {output.translation}
{ show.english.translation entry.lang lang.zh = and
    { translation empty$ not
        { translation }
        { "[English translation missing!]" }
      if$
      " (in Chinese)" * output
      write$
      format.doi duplicate$ empty$ not
        { newline$
          write$
        }
        'pop$
      if$
      " \\" write$
      newline$
      "(" write$
      ""
      before.all 'output.state :=
    }
    'skip$
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$
  year empty$
  and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {monograph}
{ output.bibitem
  output.translation
  author empty$ not
    { format.authors }
    { editor empty$ not
        { format.editors }
        { "empty author and editor in " cite$ * warning$
          ""
        }
      if$
    }
  if$
  output
  year.before.title
    { "period" name.year.delim =
        'new.sentence
        'skip$
      if$
      format.year "year" output.check
    }
    'skip$
  if$
  new.block
  format.series.vol.num.title "title" output.check
  "M" set.entry.type.id
  format.entry.type.id "" output.after
  new.block
  format.translators output
  new.sentence
  format.edition output
  new.block
  format.address.publisher output
  year.before.title not
    { format.year "year" output.check }
    'skip$
  if$
  format.pages bbl.pages.colon output.after
  format.urldate "" output.after
  output.url
  output.doi
  new.block
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  output.translation
  format.authors output
  author format.key output
  year.before.title
    { "period" name.year.delim =
        'new.sentence
        'skip$
      if$
      format.year "year" output.check
    }
    'skip$
  if$
  new.block
  control.article.title
    { format.title "title" output.check
      "M" set.entry.type.id
      format.entry.type.id "" output.after
      new.block
    }
    'skip$
  if$
  format.translators output
  new.slash
  format.editors output
  new.block
  format.series.vol.num.booktitle "booktitle" output.check
  new.block
  format.edition output
  new.block
  format.address.publisher output
  year.before.title not
    { format.year "year" output.check }
    'skip$
  if$
  format.extracted.pages bbl.pages.colon output.after
  format.urldate "" output.after
  output.url
  output.doi
  new.block
  format.note output
  fin.entry
}

FUNCTION {periodical}
{ output.bibitem
  output.translation
  format.authors output
  author format.key output
  year.before.title
    { "period" name.year.delim =
        'new.sentence
        'skip$
      if$
      format.year "year" output.check
    }
    'skip$
  if$
  new.block
  format.title "title" output.check
  "J" set.entry.type.id
  format.entry.type.id "" output.after
  new.block
  format.periodical.year.volume.number output
  new.block
  format.address.publisher output
  year.before.title not
    { format.periodical.year "year" output.check }
    'skip$
  if$
  format.urldate "" output.after
  output.url
  output.doi
  new.block
  format.note output
  fin.entry
}

FUNCTION {journal.article}
{ output.bibitem
  output.translation
  format.authors output
  author format.key output
  year.before.title
    { "period" name.year.delim =
        'new.sentence
        'skip$
      if$
      format.year "year" output.check
    }
    'skip$
  if$
  new.block
  control.article.title
    { format.title "title" output.check
      entrysubtype empty$ not
        {
          entrysubtype "newspaper" =
            { "N" set.entry.type.id }
            { "J" set.entry.type.id }
          if$
        }
        { "J" set.entry.type.id }
      if$
      format.entry.type.id "" output.after
      new.block
    }
    'skip$
  if$
  format.journal "journal" output.check
  year.before.title not
    { format.date "year" output.check }
    'skip$
  if$
  format.journal.volume output
  format.journal.number "" output.after
  format.journal.pages bbl.pages.colon output.after
  format.urldate "" output.after
  output.url
  output.doi
  new.block
  format.note output
  fin.entry
}

FUNCTION {patent}
{ output.bibitem
  output.translation
  format.authors output
  author format.key output
  year.before.title
    { "period" name.year.delim =
        'new.sentence
        'skip$
      if$
      format.year "year" output.check
    }
    'skip$
  if$
  new.block
  control.article.title
    { format.title "title" output.check
      "P" set.entry.type.id
      format.entry.type.id "" output.after
      new.block
    }
    'skip$
  if$
  format.date "year" output.check
  format.urldate "" output.after
  output.url
  output.doi
  new.block
  format.note output
  fin.entry
}

FUNCTION {electronic}
{ #1 #1 check.electronic
  #1 'entry.is.electronic :=
  #1 'is.pure.electronic :=
  output.bibitem
  output.translation
  format.authors output
  author format.key output
  year.before.title
    { "period" name.year.delim =
        'new.sentence
        'skip$
      if$
      format.year "year" output.check
    }
    'skip$
  if$
  new.block
  format.series.vol.num.title "title" output.check
  "EB" set.entry.type.id
  format.entry.type.id "" output.after
  new.block
  format.address.publisher output
  year.before.title not
    { date empty$
        { format.date output }
        'skip$
      if$
    }
    'skip$
  if$
  format.pages bbl.pages.colon output.after
  format.editdate "" output.after
  format.urldate "" output.after
  output.url
  output.doi
  new.block
  format.note output
  fin.entry
}

FUNCTION {preprint}
{ output.bibitem
  output.translation
  author empty$ not
    { format.authors }
    { editor empty$ not
        { format.editors }
        { "empty author and editor in " cite$ * warning$
          ""
        }
      if$
    }
  if$
  output
  year.before.title
    { "period" name.year.delim =
        'new.sentence
        'skip$
      if$
      format.year "year" output.check
    }
    'skip$
  if$
  new.block
  control.article.title
    { format.series.vol.num.title "title" output.check
      "A" set.entry.type.id
      format.entry.type.id "" output.after
      new.block
    }
    'skip$
  if$
  format.translators output
  new.sentence
  format.edition output
  new.block
  year.before.title not
    { date empty$
        { format.date output }
        'skip$
      if$
    }
    'skip$
  if$
  format.pages bbl.pages.colon output.after
  format.editdate "" output.after
  format.urldate "" output.after
  output.eprint
  output.url
  show.preprint not eprint empty$ or
    'output.doi
    'skip$
  if$
  new.block
  format.note output
  fin.entry
}

FUNCTION {misc}
{ get.journal.title
  duplicate$ empty$ not
    { check.arxiv.preprint
        'preprint
        'journal.article
      if$
    }
    { pop$
      booktitle empty$ not
        'incollection
        { eprint empty$ not archivePrefix empty$ not or
            'preprint
            { publisher empty$ not
                'monograph
                { entry.is.electronic
                    'electronic
                    {
                      "Z" set.entry.type.id
                      monograph
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  empty.misc.check
}

FUNCTION {archive}
{ "A" set.entry.type.id
  misc
}

FUNCTION {article} { misc }

FUNCTION {book} { monograph }

FUNCTION {booklet} { book }

FUNCTION {collection}
{ "G" set.entry.type.id
  monograph
}

FUNCTION {database}
{ "DB" set.entry.type.id
  electronic
}

FUNCTION {dataset}
{ "DS" set.entry.type.id
  electronic
}

FUNCTION {inbook} {
  booktitle empty$
    'book
    'incollection
  if$
}

FUNCTION {inproceedings}
{ "C" set.entry.type.id
  incollection
}

FUNCTION {conference} { inproceedings }

FUNCTION {legislation} { archive }

FUNCTION {map}
{ "CM" set.entry.type.id
  misc
}

FUNCTION {manual} { monograph }

FUNCTION {mastersthesis}
{ "D" set.entry.type.id
  monograph
}

FUNCTION {newspaper}
{ "N" set.entry.type.id
  article
}

FUNCTION {online}
{ "EB" set.entry.type.id
  electronic
}

FUNCTION {phdthesis} { mastersthesis }

FUNCTION {proceedings}
{ "C" set.entry.type.id
  monograph
}

FUNCTION {software}
{ "CP" set.entry.type.id
  electronic
}

FUNCTION {standard}
{ "S" set.entry.type.id
  misc
}

FUNCTION {techreport}
{ "R" set.entry.type.id
  misc
}

FUNCTION {unpublished} { misc }

FUNCTION {default.type} { misc }

INTEGERS { a }

FUNCTION {mult}
{
 'a :=      %% we store the first value
 'b :=     %% we store the second value

 b #0 <     %% We remember the sign of b, and
    {#-1 #0 b - 'b :=}     %% then consider its absolute value.
    {#1}     %%
 if$     %%

 #0     %% Put 0 on the stack.
 {b #0 >}     %% While b is strictly positive,
 {     %% we add a to the value on the stack
   a +     %% and decrement b.
   b #1 - 'b :=     %%
 }     %%
 while$     %%

 swap$         %% Last, we take the opposite
   'skip$       %% if b was negative.
   {#0 swap$ -}     %%
 if$     %%
}
FUNCTION {chr.to.value}       %% The ASCII code of a character
{
  chr.to.int$ #48 -       %% ASCII value of "0" -> 48
  duplicate$ duplicate$       %%         "1" -> 49
  #0 < swap$ #9 > or       %%    ...
  {       %%                "9" -> 57
      #48 + int.to.chr$
      " is not a number..." *
      warning$       %% Return 0 if it is not a number
      pop$ #0       %%
    }
  {}
  if$
}

FUNCTION {str.to.int.aux}     %% The auxiliary function
{
  {duplicate$ empty$ not}     %% While the string is not empty
    {       %% consider its first char
      swap$ #10 mult 'a :=    %% and ``add'' it at the end of
      duplicate$ #1 #1 substring$   %% the result.
      chr.to.value a +
      swap$
      #2 global.max$ substring$
    }
  while$
  pop$
}

FUNCTION {str.to.int}
{       %% Handling negative values
  duplicate$ #1 #1 substring$ "-" =
    {#1 swap$ #2 global.max$ substring$}
    {#0 swap$}
  if$
      %% Initialization, and then
  #0 swap$ str.to.int.aux     %% call to the aux. funtion
  swap$
    {#0 swap$ -}       %% And handle the sign.
    {}
  if$
}

FUNCTION {boolean.to.int}
{ "l" change.case$ duplicate$
    "true" =
    { pop$ #1 }
    { duplicate$ "false" =
        { pop$ #0 }
        { "unknown boolean " quote$ * swap$ * quote$ *
          " in " * cite$ * warning$
          #0
        }
      if$
    }
  if$
}

FUNCTION {GBT7714BSTCTL}
{
  CTL_max_bib_names empty$
    'skip$
    { CTL_max_bib_names str.to.int 'max.bib.names := }
  if$
  CTL_min_bib_names empty$
    'skip$
    { CTL_min_bib_names str.to.int 'min.bib.names := }
  if$
  CTL_max_cite_names empty$
    'skip$
    { CTL_max_cite_names str.to.int 'max.cite.names := }
  if$
  CTL_min_cite_names empty$
    'skip$
    { CTL_min_cite_names str.to.int 'min.cite.names := }
  if$
  CTL_family_uppercase empty$
    'skip$
    { CTL_family_uppercase boolean.to.int 'family.uppercase := }
  if$
  CTL_cite_lang empty$
    'skip$
    { CTL_cite_lang 'cite.lang := }
  if$
  CTL_year_before_title empty$
    'skip$
    { CTL_year_before_title boolean.to.int 'year.before.title := }
  if$
  CTL_name_year_delim empty$
    'skip$
    { CTL_name_year_delim 'name.year.delim := }
  if$
  CTL_italic_book_title empty$
    'skip$
    { CTL_italic_book_title boolean.to.int 'italic.book.title := }
  if$
  CTL_sentence_case_title empty$
    'skip$
    { CTL_sentence_case_title boolean.to.int 'sentence.case.title := }
  if$
  CTL_sentence_case_journal empty$
    'skip$
    { CTL_sentence_case_journal boolean.to.int 'sentence.case.journal := }
  if$
  CTL_sentence_case_booktitle empty$
    'skip$
    { CTL_sentence_case_booktitle boolean.to.int 'sentence.case.booktitle := }
  if$
  CTL_article_title empty$
    'skip$
    { CTL_article_title boolean.to.int 'control.article.title := }
  if$
  CTL_patent_country empty$
    'skip$
    { CTL_patent_country boolean.to.int 'control.patent.country := }
  if$
  CTL_entry_type_id empty$
    'skip$
    { CTL_entry_type_id boolean.to.int 'control.entry.type.id := }
  if$
  CTL_space_before_type_id empty$
    'skip$
    { CTL_space_before_type_id boolean.to.int 'control.space.before.type.id := }
  if$
  CTL_entry_medium_id empty$
    'skip$
    { CTL_entry_medium_id boolean.to.int 'control.entry.medium.id := }
  if$
  CTL_component_part_delim empty$
    'skip$
    { CTL_component_part_delim 'control.component.part.delim := }
  if$
}

FUNCTION {control.pass}
{ type$ "gbt7714bstctl" =
    'GBT7714BSTCTL
    'skip$
  if$
}

FUNCTION {control.check}
{ % TODO
}

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.name}
{ "{vv~}{ll}{, jj}{, ff}" format.name$ 't :=
  t "others" =
    { citation.et.al }
    { t get.str.lang 'name.lang :=
      name.lang lang.zh = name.lang lang.ja = or
        { t #1 "{ll}{ff}" format.name$ }
        { t #1 "{vv~}{ll}" format.name$ }
      if$
    }
  if$
}

FUNCTION {inter.word.space}
{ entry.lang lang.zh = entry.lang lang.ja = or
    { "" }
    { " " }
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  ""
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr format.lab.name citation.et.al =
      numnames max.cite.names > nameptr min.cite.names > and or
        { bbl.space *
          citation.et.al *
          #1 'namesleft :=
        }
        { nameptr #1 >
            { namesleft #1 = citation.and "" = not and
                { inter.word.space *
                  citation.and *
                  inter.word.space *
                }
                { ", " * }
              if$
            }
            'skip$
          if$
          s nameptr format.lab.name *
        }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" = booktitle empty$ not and
  or
    'author.editor.key.label
    { type$ "collection" =
      type$ "proceedings" =
      or
        { editor empty$ not
            'editor.key.organization.label
            'author.key.organization.label
          if$
        }
        'author.key.label
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list "]" contains
    { "{" short.list * "}" * }
    { short.list }
  if$
  "("
  *
  format.year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  duplicate$ "]" contains
    { "{" swap$ * "}" * }
    'skip$
  if$
  *
  'label :=
}

INTEGERS { seq.num }

FUNCTION {init.seq}
{ #0 'seq.num :=}

FUNCTION {int.to.fix}
{ "000000000" swap$ int.to.str$ *
  #-1 #10 substring$
}

FUNCTION {presort}
{ type$ "gbt7714bstctl" =
    {
      "_    "
      seq.num  int.to.fix
    }
    { set.entry.lang
      set.entry.numbered
      show.url show.doi check.electronic
      #0 'is.pure.electronic :=
      calc.label
      label sortify
      "    "
      *
      seq.num #1 + 'seq.num :=
      seq.num  int.to.fix
    }
  if$
  'sort.label :=
  sort.label *
  #1 entry.max$ substring$
  'sort.key$ :=
}

STRINGS { longest.label last.label next.extra last.extra.label }

INTEGERS { longest.label.width number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'number.label :=
  "" 'last.extra.label :=
}

FUNCTION {forward.pass}
{
  type$ "gbt7714bstctl" =
    'skip$
    {
      number.label #1 + 'number.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ type$ "gbt7714bstctl" =
    'skip$
    {
      label extra.label * 'label :=
    }
  if$
}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=
}

FUNCTION {begin.bib}
{   preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  cite.lang "macro" =
    { "\providecommand{\biband}{和}"
      write$ newline$
      "\providecommand{\bibetal}{等}"
      write$ newline$
    }
    'skip$
  if$
  "\providecommand{\natexlab}[1]{#1}"
  write$ newline$
  "\providecommand{\url}[1]{#1}"
  write$ newline$
  "\expandafter\ifx\csname urlstyle\endcsname\relax\else"
  write$ newline$
  "  \urlstyle{same}\fi"
  write$ newline$
  "\expandafter\ifx\csname href\endcsname\relax"
  write$ newline$
  "  \DeclareUrlCommand\doi{\urlstyle{rm}}"
  write$ newline$
  "  \def\eprint#1#2{#2}"
      write$ newline$
  "\else"
  write$ newline$
  "  \def\doi#1{\href{https://doi.org/#1}{\nolinkurl{#1}}}"
  write$ newline$
  "  \let\eprint\href"
      write$ newline$
  "\fi"
      write$ newline$
    }

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

READ

EXECUTE {init.state.consts}

EXECUTE {load.config}

ITERATE {control.pass}

EXECUTE {control.check}

EXECUTE {init.seq}

ITERATE {presort}

SORT

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

ITERATE {bib.sort.order}

SORT

EXECUTE {begin.bib}

ITERATE {call.type$}

EXECUTE {end.bib}
