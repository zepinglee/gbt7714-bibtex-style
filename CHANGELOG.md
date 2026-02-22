# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- 添加选项 `maxbibnames` 和 `minbibnames` 控制参考文献表中显示姓名的数量。
- 添加选项 `maxcitenames` 和 `mincitenames` 控制引注显示姓名的数量。
- 添加选项 `uppercasefamily` 控制西文姓是否大写。
- 添加选项 `initializewithhyphen` 控制名字缩写时是否保留连字符。
- 添加选项 `checkpinyin` 控制是否检测姓名为拼音。
- 添加选项 `bibfinaland` 和 `citefinaland` 控制姓名列表的结尾使用使用“和”或“and”连接。
- 添加选项 `citelang` 控制引注中“and”、“et al.”的语言。
- 添加选项 `spacebeforeetal` 控制引注的中文姓名与“等”之间是否有空格。
- 添加选项 `yearbeforetitle` 控制著者-出版年制出版年是否置于题名前。
- 添加选项 `nameyeardelim` 控制著者-出版年制姓名和出版年之间的分隔符。
- 期刊题名 `journal` 和专著题名 `booktitle` 默认转为 sentence case。
- 新增选项 `sentencecase`、`sentencecasetitle`、`sentencecasejournal`、`sentencecasebooktitle` 控制是否将对应题名转为 sentence case。
- 新增选项 `capitalizesubtitle` 控制 sentence case 题名冒号后是否大写。
- 新增选项 `articletitle` 控制期刊文章是否显示题名。
- 新增选项 `patentcountry` 控制是否显示专利国别。
- 新增选项 `entrytypeid` 控制是否著录文献类型标识。
- 新增选项 `spacebeforetypeid` 控制题名与文献类型标识之间是否有空格。
- 新增选项 `entrymediumid` 控制是否著录载体类型标识。
- 新增选项 `in` 控制专著的析出文献是否著录“In:”或“见”。
- 新增选项 `emphbooktitle` 控制刊名是否使用斜体。
- 新增选项 `shortjournal` 控制刊名是否使用缩写。
- 新增选项 `dotlessjournal` 控制刊名缩写是否移除句点。
- 新增选项 `emphjournal` 控制刊名是否使用斜体。
- 新增选项 `linktitle` 控制刊名是否有超链接。
- 新增选项 `unknownpublisher` 控制无出版地或无出版者时是否著录“出版地不详”、“S.l.”、“出版者不详”、“s.n.”等内容。
- 新增选项 `spacebeforepages` 控制页码前是否有空格。
- 新增选项 `pageranges` 控制页码著录起止范围或首页。
- 新增选项 `pagerangedelim` 起止页码的分隔符。
- 新增选项 `urldate` 控制是否著录引用日期。
- 新增选项 `url` 控制纸质文献是否著录 URL。
- 新增选项 `doi` 控制是否著录 DOI。
- 新增选项 `eprint` 控制预印本是否著录标识符。
- 新增选项 `note` 控制是否著录附注。
- 新增选项 `enddot` 控制参考文献的结尾是否用“.”号标识。

### Changed

- 更改 `bst` 样式名称的后缀为 `-numeric` 和 `-authoryear`，与其他 Bib(La)TeX 样式保持一致。
- 符号的全角/半角改为 2025 标准：“. ”使用半角符号加空格，其他标识符号用全角符号。
- 按照语言习惯输出 `\citet*` 和 `\citep*` 完整姓名列表的格式。
- 文献类型标识的字段改为 `entrytypeid`。
- 载体类型标识的字段改为 `entrymediumid`。
- 更新预印本的格式。
- DOI 的前缀“DOI: ”去掉空格。
- 专利 `@patent` 优先使用专利申请者/所有者 `holder`，再使用发明者 `author`。

### Deprecated

- 文献类型标识的字段 `mark` 已过时。
- 载体类型标识的字段 `medium` 已过时。
- 带 `-numerical` 和 `-author-year` 后缀的 `bst` 样式名称已过时。

### Fixed

- 报纸的版次修正为使用 `pages` 字段，不再使用 `number` 字段。
- 修正英文文献的译者缺失“, trans.”的问题。

## [2.1.9] - 2026-01-15

### Added

- 添加 `@thesis` 类型（[#197](https://github.com/zepinglee/gbt7714-bibtex-style/issues/197)）。

### Changed

- 参照 GB/T 7714—2025 修改预印本的格式（[ustctug/ustcthesis#488](https://github.com/ustctug/ustcthesis/issues/488)）。

### Fixed

- 修正 `edition` 为 `1` 的报错（[ustctug/ustcthesis#476](https://github.com/ustctug/ustcthesis/issues/476)）。

### Removed

- 移除 `show.preprint` 选项。

## [2.1.8] - 2025-06-22

### Added

- 添加选项 `locator-inside-brackets` 控制引注的页码是否在括号外（[#181](https://github.com/zepinglee/gbt7714-bibtex-style/issues/181)）。
- 新增支持转换 Unicode 带变音符号字母的大小写（PR [#174](https://github.com/zepinglee/gbt7714-bibtex-style/pull/174) by [@LeeiFrankJaw](https://github.com/LeeiFrankJaw), resolve [#145](https://github.com/zepinglee/gbt7714-bibtex-style/issues/145)）。
- 新增 `lowercase.word.after.colon` 选项控制 sentence case 冒号后的字母是否大小写（PR [#174](https://github.com/zepinglee/gbt7714-bibtex-style/pull/174) by [@LeeiFrankJaw](https://github.com/LeeiFrankJaw), resolve [#172](https://github.com/zepinglee/gbt7714-bibtex-style/issues/172#issuecomment-2445775274)）。

### Changed

- 改进 `@misc` 的预印本判断方式（[#155](https://github.com/zepinglee/gbt7714-bibtex-style/issues/155#issuecomment-2715067957)）。
- 将 `pages` 的 en dash（U+2013）和波浪线“～”（U+FF5E）转为 hyphen（PR [#174](https://github.com/zepinglee/gbt7714-bibtex-style/pull/174) by [@LeeiFrankJaw](https://github.com/LeeiFrankJaw), resolve [#172](https://github.com/zepinglee/gbt7714-bibtex-style/issues/172#issuecomment-2445782552)）。

## [2.1.7] - 2025-03-11

### Added

- 新增对 `\noopsort` 的支持，与 `xampl.bib` 兼容（[CTeX-org/forum#315](https://github.com/CTeX-org/forum/issues/315)）。

### Fixed

- 修正多余的年份后缀（[#176](https://github.com/zepinglee/gbt7714-bibtex-style/issues/176)）。

## [2.1.6] - 2024-03-08

## Added

新增选项 `link.journal` 允许在期刊题名添加超链接（[#144](https://github.com/zepinglee/gbt7714-bibtex-style/issues/144)）。

### Changed

`@inbook` 改为按照是否有 `booktitle` 选择“专著”或“专著的吸出文献”格式（[tuna/thuthesis#930](https://github.com/tuna/thuthesis/issues/930)）。

## Fixed

修复 `not brace-balanced` 的警告（[#113](https://github.com/zepinglee/gbt7714-bibtex-style/issues/113)）。

## [2.1.5] - 2022-10-03

### Changed

- “volume”和“number”改为缩写“Vol.”和“No.”（[#104](https://github.com/zepinglee/gbt7714-bibtex-style/issues/104)）。
- 纯电子文献缺失“出版日期”时不再警告。

## [2.1.4] - 2022-03-21

### Added

- 新增选项 `component.part.label` 控制表示析出文献的符号，可选 `"slash"`, `"in"`, `"none"`。
- 新增 `entrysubtype` 域的支持（[hushidong/biblatex-gb7714-2015#113](https://github.com/hushidong/biblatex-gb7714-2015/issues/113)）。
- 不著录第 1 版（[hushidong/biblatex-gb7714-2015#117](https://github.com/hushidong/biblatex-gb7714-2015/issues/117)）。

### Changed

- 表示析出文献的“In:”改为编者姓名前。

### Removed

- 移除选项 `slash.for.extraction` 和 `in.booktitle`。

## [2.1.3] - 2021-12-08

### Added

- 新增选项 `show.patent.country` 控制专利文献的题名是否含专利国别。

### Changed

- 预印本 `@preprint` 的文献类型标识改为“`A`”（[#89](https://github.com/zepinglee/gbt7714-bibtex-style/issues/89)）。
- 预印本的信息（如“arXiv: 1703.03400”）改在日期后输出（[#89](https://github.com/zepinglee/gbt7714-bibtex-style/issues/89)）。
- 默认显示预印本的信息（[#89](https://github.com/zepinglee/gbt7714-bibtex-style/issues/89)）。

### Fixed

- 修正了只有 `howpublished` 时的 URL 显示问题（[stone-zeng/fduthesis#218](https://github.com/stone-zeng/fduthesis/issues/218)）。
- 修正了出版年后缀超出“z”的问题（[#90](https://github.com/zepinglee/gbt7714-bibtex-style/issues/90)）。

## [2.1.2] - 2021-06-20

### Added

- 新增选项 `italic.book.title` 控制书名使用斜体。
- 新增选项 `wave.dash.in.pages` 控制起止页码使用波浪号。
- 新增选项 `end.with.period` 控制结尾加句点。

### Fixed

- 修正了 `article` 只有 `date` 时年份缺失的问题（[ustctug/ustcthesis#299](https://github.com/ustctug/ustcthesis/issues/299)）。

## [2.1.1] - 2021-04-03

### Added

- 新增选项 `space.before.mark` 选择文献类型标识前是否有空格。

### Changed

- 默认不再显示“出版地不详”、“S.l.”等信息。

### Fixed

- 修正了上标式引用后与中文之间多余的空格（[tuna/thuthesis#624](https://github.com/tuna/thuthesis/issues/624)）。
- 修正了姓名或年份中含有中括号时的引用错误，该问题是同时使用 `bibunits` 导致的（[tuna/thuthesis#630](https://github.com/tuna/thuthesis/issues/630)）。

## [2.1] - 2020-12-17

### Changed

- 著者-出版年制的 `key` 域如果含有多个姓名的拼音，改为使用 ` & ` 分隔（[#68](https://github.com/zepinglee/gbt7714-bibtex-style/issues/68)）。
- 选项 `abbreviate.journal` 改为 `short.journal`。
- 选项 `max.num.authors` 改为 `et.al.min` 和 `et.al.use.first` 控制输出作者姓名的数量。
- 期刊的起止年份分隔符由 `--` 改为 `/`（[hushidong/biblatex-gb7714-2015#79](https://github.com/hushidong/biblatex-gb7714-2015/pull/79)）。
- 统一空格的处理。
- 添加选项 `space.before.pages` 控制页码与前面的冒号之间有无空格。

## Fixed

- 修正第一作者姓名相同、年份相同但作者数量不同时的年份标签。
- 修正 `number` 样式 `\citep` 命令引用的页码位置。

### Added

- 新增选项 `show.urldate` 选择是否显示非电子文献的引用日期。
- 兼容 biblatex 的 `langid` 域。
- 兼容 biblatex 的 `journaltitle` 和 `shortjournal` 域。
- 兼容 biblatex 的 `location` 域。
- 兼容 biblatex 的 `eprinttype` 域。
- 新增选项 `year.after.author` 选择将年份置于著者后。
- 新增选项 `terms.in.macro` 选择以 TeX 宏输出“和”、“等”。

## [2.0.2] - 2020-06-08

### Changed

- 期刊的页码前默认有空格（[#62](https://github.com/zepinglee/gbt7714-bibtex-style/issues/62)）。

### Added

- 支持预印本（preprint）文献类型。

## [2.0.1] - 2020-03-14

### Added

- 新增选项 `only.start.page`。
- 增加选项 `title.in.journal`。
- 增加选项 `abbreviate.journal`。
- 增加选项 `show.english.translation`。

### Fixed

- 修正 DOI 中含有下划线的问题。

## [2.0] - 2020-03-04

### Changed

- 需要用户在主文档使用 `\bibliographystyle` 命令。
- 更改 `bst` 文件名为 `-numerical` 和 `-author-year`。
- 不再默认对顺序编码制的引用标注进行排序。

### Added

- 兼容 `chapterbib` 宏包（[#48](https://github.com/zepinglee/gbt7714-bibtex-style/issues/48)）。

## [1.1.2] - 2019-11-20

### Changed

- 不再依赖 `etoolbox`。

### Fixed

- 修正与 `newtx` 冲突（[#42](https://github.com/zepinglee/gbt7714-bibtex-style/issues/42)）。

## [1.1.1] - 2019-03-21

### Added

- 允许自定义文种的顺序。

## [1.1] - 2019-01-02

### Added

- 允许自定义“et al”。

### Changed

- 修正 series 的 bug。

## [1.0.9] - 2018-08-05

### Added

- 增加选项在题名添加超链接。

### Changed

- 不再转换题名 volume 的大小写。
- 修正不显示 url 的选项。

## [1.0.8] - 2018-06-23

### Added

- 新增接口供用户自定义样式。
- 支持 howpublished 中的 url。

### Changed

- 使用 `xurl` 的方法改进 URL 断行。
- 使用“~”连接英文姓名。

## [1.0.7] - 2018-05-12

### Changed

- 修正了检测 Unicode 语言。

## [1.0.6] - 2018-05-10

### Changed

- 文献列表的数字标签左对齐。
- 不再处理中文标题的英文单词的大小写。

## [1.0.5] - 2018-04-18

### Added

- 允许著录多个 DOI。

## [1.0.4] - 2018-04-12

### Changed

- 页码的连接号由 en dash 改为 hyphen。

## [1.0.3] - 2018-03-29

### Changed

- 顺序编码制连续两个文献引用之间使用连接号。

## [1.0.2] - 2018-03-16

### Changed

- 正确识别姓名中的“others”。

## [1.0.1] - 2018-03-09

### Changed

- 著者出版年制的文献引用不再排序。

## [1.0] - 2018-01-01

### Changed

- Initial release.。

[Unreleased]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.9...HEAD
[2.1.9]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.8...v2.1.9
[2.1.8]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.7...v2.1.8
[2.1.7]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.6...v2.1.7
[2.1.6]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.5...v2.1.6
[2.1.5]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.4...v2.1.5
[2.1.4]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.3...v2.1.4
[2.1.3]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.2...v2.1.3
[2.1.2]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1.1...v2.1.2
[2.1.1]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.1...v2.1.1
[2.1]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.0.2...v2.1
[2.0.2]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.0.1...v2.0.2
[2.0.1]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v2.0...v2.0.1
[2.0]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.1.2...v2.0
[1.1.2]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.1...v1.1.1
[1.1]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.9...v1.1
[1.0.9]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.8...v1.0.9
[1.0.8]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.7...v1.0.8
[1.0.7]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.6...v1.0.7
[1.0.6]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.5...v1.0.6
[1.0.5]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.4...v1.0.5
[1.0.4]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.3...v1.0.4
[1.0.3]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/zepinglee/gbt7714-bibtex-style/compare/v1.0...v1.0.1
[1.0]: https://github.com/zepinglee/gbt7714-bibtex-style/releases/tag/v1.0
