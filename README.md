# GB/T 7714-2015 BibTeX Style

[![Travis build](https://travis-ci.org/zepinglee/gbt7714-bibtex-style.svg?branch=master)](https://travis-ci.org/zepinglee/gbt7714-bibtex-style)
[![GitHub release](https://img.shields.io/github/release/zepinglee/gbt7714-bibtex-style/all.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/releases/latest)
[![GitHub commits](https://img.shields.io/github/commits-since/zepinglee/gbt7714-bibtex-style/latest.svg)](https://github.com/zepinglee/gbt7714-bibtex-style/commits/master)


## 新特性

- 兼容 natbib
- 支持顺序编码制和著者-出版年制两种风格
- 自动识别语言


## 使用方法

1. 将 bst 文件和 sty 文件复制到工作目录。
2. 调用宏包 `\usepackage[authoryear]{gbt7714}`。
3. **不再**需要调用 `\bibliographystyle` 命令。


## 注意事项

1. bib 数据库应使用 UTF-8 编码。
2. 中文文献使用 author-year 式参考文献表时，必须在 `key` 域填写作者姓名的拼音，
才能使得文献列表按照拼音排序，比如：
```
@book{capital,
  author = {马克思 and 恩格斯},
  key    = {ma3 ke4 si1   en1 ge2 si1},
  ...
```
3. 默认可以自动处理 `language`, `mark`, `medium`，用户也可以指定，比如：
```
language = {japanese},
mark = {M},
medium = {CD},
```


## 文献类型

文献类型         | 标识代码 | Entry Type
---              | :---:    | ---
普通图书         | M        | `book` 或 `inbook`
图书的析出文献   | M        | `incollection`
会议录           | C        | `proceedings`
会议录的析出文献 | C        | `inproceedings` 或 `conference`
汇编             | G        | `collection`\*
报纸             | N        | `newspaper`\*
期刊的析出文献   | J        | `article`
学位论文         | D        | `mastersthesis` 或 `phdthesis`
报告             | R        | `techreport`
标准             | S        | `standard`\*
专利             | P        | `patent`\*
数据库           | DB       | `database`\*
计算机程序       | CP       | `software`\*
电子公告         | EB       | `online`\*
档案             | A        | `archive`\*
舆图             | CM       | `map`\*
数据集           | DS       | `dataset`\*
其他             | Z        | `misc`

注：
- 带 “\*” 的类型不是 BibTeX 的标准文献类型。
- 不支持的 BibTeX 标准类型有：`booklet`, `manual`, `unpublished`。


## 支持的著录项目

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
学校（用于phdthesis）  | `school`
机构（用于techreport） | `institution`
出版年                 | `year`
卷                     | `volume`
期（或者专利号）       | `number`
引文页码               | `pages`
更新或修改日期         | `date`\*
引用日期               | `urldate`\*
获取和访问路径         | `url`
数字对象唯一标识符     | `doi`
语言                   | `language`\*
拼音（用于排序）       | `key`

注:
- 其中带星号的不是 BibTeX/natbib 的标准著录项目。
- 不支持的 BibTeX 标准著录项目有 annote, chapter, crossref, howpublished,
month, note, type。

## 参考文献著录标准

- [GB/T 7714-2015 信息与文献 参考文献著录规则.pdf](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style/files/153951/GBT.7714-2015.pdf)
- [GB/T 7714-2005 文后参考文献著录规则.pdf](https://github.com/Haixing-Hu/typesetting-standard/raw/master/%E5%9B%BE%E4%B9%A6%E3%80%81%E6%9C%9F%E5%88%8A%E3%80%81%E8%AE%BA%E6%96%87%E7%9A%84%E7%BC%96%E6%8E%92/%E3%80%90GB:T%207714-2005%E3%80%91%E6%96%87%E5%90%8E%E5%8F%82%E8%80%83%E6%96%87%E7%8C%AE%E8%91%97%E5%BD%95%E8%A7%84%E5%88%99.pdf)


## 相关项目

- 胡振震 [hushidong/biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)
- 沈周 [szsdk/biblatex-gbt77142005](https://github.com/szsdk/biblatex-gbt77142005)
- 胡海星 [Haixing-Hu/GBT7714-2005-BibTeX-Style](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style)
- 李志奇 [基于biblatex的符合GBT7714-2005的中文文献生成工具](http://bbs.ctex.org/forum.php?mod=viewthread&tid=74474)
- Casper Ti. Vector [CasperVector/biblatex-caspervector](https://github.com/CasperVector/biblatex-caspervector)
- 吴凯 [发布GBT7714-2005.bst version1 Beta版](http://bbs.ctex.org/forum.php?mod=viewthread&tid=33591)
