# GB/T 7714-2015 BibTeX Style

## 新特性

* 兼容 natbib

* 自动识别语言

## 注意事项

1. bib 数据库应使用 UTF-8 编码

2. 中文文献使用 author-year 式参考文献表时，应在 `pinyin` 域填写作者姓名的拼音，才能使得文献列表按照拼音排序。

3. 默认可以自动处理 `language`, `mark`, `media`，用户也可以指定，比如：
```
language = {ja},
mark = {M},
media = {OL},
```

## 当前支持的文献类型

文献类型 | entry type
---|---
普通图书 | `book` 或 `inbook`
图书（的析出文献） | `article` 或 `incollection`
会议录 | `proceedings`
会议录（的析出文献） | `inproceedings` 或 `conference`
汇编 | `collection`*
报纸 | `newspaper`*
期刊（的析出文献） | `article`
学位论文 | `masterthesis` 或 `phdthesis`
报告 | `techreport`
标准 | `standard`*
专利 | `patent`*
数据库 | `database`*
计算机程序 | `program`*
电子公告 | `online`*
档案 | `archive`*
舆图 | `map`*
数据集 | `dataset`*
其他 | `misc`

注：

1. `ariticle` 会根据 journal 域判断是图书还是期刊的析出文献

2. `proceedings` 按照“专著”处理，`inproceedings` 按照“专著中的析出文献”处理。

3. 带 “*” 的类型不是 BibTeX 原生支持的。

4. 不支持的 BibTeX 原生类型有：`booklet`, `manual`, `unpublished`。

## 支持的著录项目

著录项目（域） | Entry field
---|---
主要责任者 | `author`
题名 | `title`
文献类型标识 | `mark`*
载体类型标识 | `media`*
翻译者 | `translator`*
编辑 | `editor`
组织（用于会议） | `organization`
图书题名 | `booktitle`
系列 | `series`
期刊题名 | `journal`
版本 | `edition`
出版地 | `address`
出版者 | `publisher`
学校（用于phdthesis） | `school`
机构（用于techreport） | `institution`
出版年（或电子文献的更新日期） | `year`
卷 | `volume`
期（或者专利号） | `number`
引文页码 | `pages`
引用日期 | `urldate`*
获取和访问路径 | `url`
数字对象唯一标识符 | `doi`
语言 | `language`*
拼音（用于排序） | `pinyin`*

注:

1. 带 “*” 的类型不是 natbib 原生支持的。

## 参考文献著录标准

[GB/T 7714-2015 信息与文献 参考文献著录规则.pdf](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style/files/153951/GBT.7714-2015.pdf)

[GB/T 7714-2005 文后参考文献著录规则.pdf](https://github.com/Haixing-Hu/typesetting-standard/raw/master/%E5%9B%BE%E4%B9%A6%E3%80%81%E6%9C%9F%E5%88%8A%E3%80%81%E8%AE%BA%E6%96%87%E7%9A%84%E7%BC%96%E6%8E%92/%E3%80%90GB:T%207714-2005%E3%80%91%E6%96%87%E5%90%8E%E5%8F%82%E8%80%83%E6%96%87%E7%8C%AE%E8%91%97%E5%BD%95%E8%A7%84%E5%88%99.pdf)


## 相关项目

[hushidong/biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)

[szsdk/biblatex-gbt77142005](https://github.com/szsdk/biblatex-gbt77142005)

[Haixing-Hu/GBT7714-2005-BibTeX-Style](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style)

[吴凯 GBT7714-2005.bst](http://bbs.ctex.org/forum.php?mod=viewthread&tid=33591)

[CasperVector/biblatex-caspervector](https://github.com/CasperVector/biblatex-caspervector)
