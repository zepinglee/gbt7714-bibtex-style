# GB/T 7714—2015 BibTeX Style

[![CTAN](https://img.shields.io/ctan/v/gbt7714.svg)](https://ctan.org/pkg/gbt7714)
[![GitHub release](https://img.shields.io/github/release/zepinglee/gbt7714-bibtex-style/all.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/releases/latest)
[![GitHub commits](https://img.shields.io/github/commits-since/zepinglee/gbt7714-bibtex-style/latest.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/commits/master)
[![Build](https://github.com/zepinglee/gbt7714-bibtex-style/workflows/build/badge.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/actions)

## Introduction

The `gbt7714` package provides a BibTeX implementation for the China's
national bibliography style standard GB/T 7714.
It consists of `.bst` files for both numeric and author-date styles as well as a
LaTeX package which provides the citation style defined in the standard.
It is compatible with `natbib` and supports language detection (Chinese
and English) for each biblilography entry.

- Homepage: https://github.com/zepinglee/gbt7714-bibtex-style
- Maintainer: Zeping Lee
- Email: zepinglee AT gmail DOT com
- License: LaTeX Project Public License 1.3c or later

## 简介

GB/T 7714—2015《信息与文献 参考文献著录规则》是中国的参考文献推荐标准。国内的绝大部分学术期刊、学位论文都使用了基于该标准的格式。本宏包是国标的 BibTeX 实现，主要有以下特性：

- 兼容 `natbib` 宏包。
- 支持 “顺序编码制” 和 “著者-出版年制” 两种风格。
- 自动识别语言并进行相应处理。
- 提供了简单的接口供用户修改样式。
- 同时提供了 2005 版的 `.bst` 文件。

## 版本 v2.0 的重要修改

从 v2.0 版本开始（2020-03-04），用户必须在文档中使用 `\bibliographystyle` 命令选择参考文献样式，如 `gbt7714-numerical` 或 `gbt7714-author-year`。在早期的版本中，选择文献样式的方法是将 `numbers` 或 `super` 等参数传递给 `gbt7714`，而不能使用 `\bibliographystyle`。这跟标准的 LaTeX 接口不一致，所以将被弃用。

## 使用方法

以下是 `gbt7714` 宏包的一个简单示例。

```latex
\documentclass{ctexart}
\usepackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
\begin{document}
  \cite{...}
  ...
  \bibliography{bibfile}
\end{document}
```

1. 在导言区调用宏包 `gbt7714`；
2. 使用 `\bibliographystyle` 选择参考文献的样式；
3. 在正文中 `\cite` 文献；
4. 使用 `\bibliography` 命令生成参考文献表。

## 注意事项

1. `bib` 数据库应使用 UTF-8 编码。
2. 使用著者-出版年制参考文献表时，中文的文献**必须**在 `key` 域填写著者姓名的拼音，才能按照拼音排序，比如：

```bib
@book{capital,
  author = {马克思 and 恩格斯},
  key    = {ma3 ke4 si1 & en1 ge2 si1},
  ...
}
```

同一处引用多篇文献时，应将各篇文献的 key 一同写在 `\cite` 命令中，如 `\cite{knuth84,lamport94,mittelbach04}`。如遇连续编号，可以自动转为起讫序号并用短横线连接。

若需要标出引文的页码，可以标在 `\cite` 的可选参数中，如 `\cite[42]{knuth84}`。

更多的引用标注方法可以参考 `natbib` 宏包的使用说明。

本宏包默认情况下可以自动识别文献语言，并自动处理文献类型和载体类型标识，但是在少数情况下需要用户手动指定，如：

```bib
@misc{citekey,
  langid = {japanese},
  mark   = {Z},
  medium = {DK},
  ...
}
```

可选的语言有 `english`, `chinese`, `japanese`, `russian`。

## 文献类型

文献类型         | 标识代码 | Entry Type
---              | :---:    | ---
普通图书         | M        | `@book`
图书的析出文献   | M        | `@incollection`
会议录           | C        | `@proceedings`
会议录的析出文献 | C        | `@inproceedings` 或 `@conference`
汇编             | G        | `@collection`\*
报纸             | N        | `@newspaper`\*
期刊的析出文献   | J        | `@article`
学位论文         | D        | `@mastersthesis` 或 `@phdthesis`
报告             | R        | `@techreport`
标准             | S        | `@standard`\*
专利             | P        | `@patent`\*
数据库           | DB       | `@database`\*
计算机程序       | CP       | `@software`\*
电子公告         | EB       | `@online`\*
档案             | A        | `@archive`\*
舆图             | CM       | `@map`\*
数据集           | DS       | `@dataset`\*
其他             | Z        | `@misc`

注：

- 带 “\*” 的类型不是 BibTeX 的标准文献类型。

## 著录项目

著录项目（域）         | Entry Field
---                    | ---
主要责任者             | `author`
题名                   | `title`
文献类型标识           | `mark`\*
载体类型标识           | `medium`\*
翻译者                 | `translator`\*
编辑                   | `editor`
组织（用于会议）       | `organization`
图书题名               | `booktitle`
系列                   | `series`
期刊题名               | `journal`
版本                   | `edition`
出版地                 | `address`
出版者                 | `publisher`
学校（用于 `phdthesis`）  | `school`
机构（用于 `techreport`） | `institution`
出版年                 | `year`
卷                     | `volume`
期（或者专利号）       | `number`
引文页码               | `pages`
更新或修改日期         | `date`\*
引用日期               | `urldate`\*
获取和访问路径         | `url`
数字对象唯一标识符     | `doi`
语言                   | `langid`\*
拼音（用于排序）       | `key`

注:

- 其中带星号的不是 BibTeX/natbib 的标准著录项目。
- 不支持的 BibTeX 标准著录项目有 `annote`, `chapter`, `crossref`, `month`, `type`。

## 参考文献著录标准

- [GB/T 7714—2015 信息与文献 参考文献著录规则](http://www.cessp.org.cn/uploads/1/file/public/201607/20160708142456_8mqgu0dpgk.pdf)

## 相关讨论

- 陈浩元（标准起草人）：[GB/T 7714 新标准对旧标准的主要修改及实施要点提示](http://bjxb.cessp.org.cn/ch/reader/view_abstract.aspx?file_no=20150411&flag=1)
- 陈浩元（标准起草人）：[GB/T 7714一2015 的新点、实施要点及其他](http://www.cessp.org.cn/uploads/1/file/public/201607/20160705202202_0airiqt165.pdf)（Slides）
- 梁海：[知乎回答「GB/T 7714—2005 一些有关空格和标点符号的细节问题？」](https://www.zhihu.com/question/23371611/answer/24696880)

## 相关项目

- 胡振震 [hushidong/biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)
- 沈周 [szsdk/biblatex-gbt77142005](https://github.com/szsdk/biblatex-gbt77142005)
- 胡海星 [Haixing-Hu/GBT7714-2005-BibTeX-Style](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style)
- 李志奇 基于biblatex的符合GBT7714-2005的中文文献生成工具
- Casper Ti. Vector [CasperVector/biblatex-caspervector](https://github.com/CasperVector/biblatex-caspervector)
- 吴凯 发布GBT7714-2005.bst version1 Beta版
