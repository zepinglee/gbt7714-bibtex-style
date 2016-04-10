# GB/T 7714-2015 BibTeX Style

## 开发进度

- [ ] 检查全角／半角
- [ ] 检查空白距离
- [x] 文献类型标识
- [x] 著录项目和格式（中英文）
- [ ] 其他类型文献的支持
- [ ] author-year 式 (主要是排序)

## 当前支持的文献类型

文献类型 | entry type

- [x] 普通图书：`book` 或 `inbook`
- [x] 图书（的析出文献）：`article`
- [x] 会议录：`proceedings`
- [x] 会议录（的析出文献）：`inproceedings` 或 `conference`
- [x] 汇编：`collection`*
- [x] 报纸：`newspaper`*
- [ ] 期刊：`journal`*
- [ ] 期刊（的析出文献）：`article`
- [ ] 学位论文：`masterthesis` 或 `phdthesis`
- [ ] 报告：`techreport`
- [ ] 标准：`standard`*
- [ ] 专利：`patent`*
- [ ] 数据库：`database`*
- [ ] 计算机程序：`program`*
- [ ] 电子公告：
- [ ] 档案：
- [ ] 舆图：
- [ ] 数据集：
- [ ] 其他：`misc`

注：
1. `ariticle` 会根据 journal 域判断是图书还是期刊的析出文献
2. `proceedings` 按照“专著”处理，`inproceedings` 按照“专著中的析出文献”处理。
3. 带 “*” 的类型不是 BibTeX 原生支持的。
4. 不支持的 BibTeX 的原生类型有：`booklet`, `manual`, `unpublished`。

## 支持的著录项目

著录项目 | Entry field
---|---
出版地 | address
主要责任者 | author
图书题名 | booktitle
引用日期 | citedate
交叉引用 | crossref
数字对象唯一标识符 | doi
版本 | edition
编辑 | editor
机构（用于techreport） | institution
期刊题名 | journal
排序的关键词 | key
语言 | language
文献类型标识 | mark
期 | number
组织（用于会议） | organization
引文页码 | pages
出版者 | publisher
学校 | school
系列 | series
析出文献题名 | title
翻译者 | translator
获取和访问路径 | url
卷 | volume
出版年 | year


## 参考文献著录标准

[GB/T 7714-2015 信息与文献 参考文献著录规则.pdf](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style/files/153951/GBT.7714-2015.pdf)


## 相关项目

[Haixing-Hu/GBT7714-2005-BibTeX-Style](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style)
