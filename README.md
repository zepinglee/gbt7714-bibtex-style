# GB/T 7714—2015 BibTeX Style

[![CTAN](https://img.shields.io/ctan/v/gbt7714.svg)](https://ctan.org/pkg/gbt7714)
[![GitHub release](https://img.shields.io/github/release/zepinglee/gbt7714-bibtex-style/all.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/releases/latest)
[![GitHub commits](https://img.shields.io/github/commits-since/zepinglee/gbt7714-bibtex-style/latest.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/commits/master)
[![Build](https://github.com/zepinglee/gbt7714-bibtex-style/actions/workflows/test.yml/badge.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/actions)


## Introduction

The `gbt7714` package provides a comprehensive and configurable BibTeX
implementation of the Chinese National Standard GB/T 7714, "Information and
documentation---Rules for bibliographic references and citations to information
resources."
The BibTeX styles included in the package support both numeric and author-year
citation systems, and are fully compatible with the natbib package for
advanced citation commands and formatting.
These styles are designed to automatically detect the language (Chinese or
English) of each bibliographic entry and apply the appropriate localization.
Additionally, the package exposes a range of configuration options, allowing
users to easily adapt the output to the requirements of specific academic
journals or institutions.

- Homepage: https://github.com/zepinglee/gbt7714-bibtex-style
- Maintainer: Zeping Lee
- Email: zepinglee AT gmail DOT com
- License: LaTeX Project Public License 1.3c or later


## 简介

`gbt7714` 宏包提供了一套全面且高度可配置的 BibTeX 实现，旨在严格遵循中国国家标准
GB/T 7714
《[信息与文献 参考文献著录规则](https://std.samr.gov.cn/gb/search/gbDetailed?id=4507EFE13D37CB6AE06397BE0A0A601F)》。
该宏包的 BibTeX 样式不仅支持顺序编码制和著者-出版年制两种引用体系，
还与 `natbib` 宏包完全兼容，从而支持更高级的引用命令和格式。
这些 BibTeX 样式能够自动识别参考文献条目的中/英文语言，并进行相应的处理。
此外，该宏包还提供了丰富的配置选项，方便用户根据特定学术期刊或机构的具体要求，
对参考文献的输出格式进行调整。


## 使用方法

以下是 `gbt7714` 宏包的一个简单示例。

```latex
\documentclass[UTF8]{ctexart}
\usepackage{gbt7714}
\bibliographystyle{gbt7714-numeric}
\begin{document}
\cite{...}
...
\bibliography{bibfile}
\end{document}
```

1. 在导言区调用宏包 `gbt7714`。
2. 使用 `\bibliographystyle` 选择参考文献的样式。
3. 在正文中使用 `\cite` 命令引用文献。
4. 使用 `\bibliography` 调用 BibTeX 数据库 `bibfile.bib`，并生成参考文献表。

编译方式

以 XeLaTeX 为例，编译 `main.tex` 文件。

```bash
xelatex main
bibtex main
xelatex main
xelatex main
```

## 参考文献著录标准

- [`GB/T 7714—2025 信息与文献 参考文献著录规则.pdf`](https://publishmedia.cbpt.cnki.net/portal/minio/webs/hbxy/media/web/2026/01/20/GBT%207714—2025%20信息与文献%20参考文献著录规则.pdf)


## 相关讨论

1. 陈浩元（标准起草人）. GB/T 7714 新标准对旧标准的主要修改及实施要点提示\[J/OL\]. 编辑学报，2015，27（4）：339-343. <http://bjxb.cessp.org.cn/ch/reader/view_abstract.aspx?file_no=20150411&flag=1>. DOI:[10.16811/j.cnki.1001-4314.2015.04.015](https://doi.org/10.16811/j.cnki.1001-4314.2015.04.015).
2. 陈浩元. 关于 GB/T 7714—2015 编校失误答同人问\[J/OL\]. 编辑学报，2016，28（1）：2. <http://bjxb.cessp.org.cn/ch/reader/view_abstract.aspx?file_no=20160138&flag=1>.
3. 陈浩元. 怎样著录著者-出版年制联机网络文献的“出版年”？\[J/OL\]. 编辑学报，2023，35（5）：590. <http://bjxb.cessp.org.cn/ch/reader/view_abstract.aspx?file_no=20230528&flag=1>.
4. 陈浩元. 对 GB/T 7714—2015 的标识符号问题咨询的答复\[J/OL\]. 编辑学报，2024，36（2）：139. <http://bjxb.cessp.org.cn/ch/reader/view_abstract.aspx?file_no=20240205&flag=1>.
5. 刘孝平，张耀蕾，刘霞. GB/T 7714—2015《信息与文献 参考文献著录规则》修订研究\[J/OL\]. 数字图书馆论坛，2024，20（12）：28-34. <https://journals.istic.ac.cn/dlf/ch/reader/view_abstract.aspx?file_no=202412004&flag=1>. DOI:[10.3772/j.issn.1673-2286.2024.12.004](https://doi.org/10.3772/j.issn.1673-2286.2024.12.004).


## 相关项目

- 胡振震 [hushidong/biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)
- 沈周 [szsdk/biblatex-gbt77142005](https://github.com/szsdk/biblatex-gbt77142005)
- 胡海星 [Haixing-Hu/GBT7714-2005-BibTeX-Style](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style)
- 李志奇 基于biblatex的符合GBT7714-2005的中文文献生成工具
- Casper Ti. Vector [CasperVector/biblatex-caspervector](https://github.com/CasperVector/biblatex-caspervector)
- 吴凯 发布GBT7714-2005.bst version1 Beta版
