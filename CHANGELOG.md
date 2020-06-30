# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]
### Changed
- 文献类型标识前默认有空格，可通过 `space.before.mark` 选项来控制（ustctug/ustcthesis/#267）
- 选项 `abbreviate.journal` 改为 `short.journal`

### Added
- 新增选项 `show.urldate` 选择是否显示非电子文献的引用日期
- 兼容 biblatex 的 `langid` 域
- 兼容 biblatex 的 `journaltitle` 和 `shortjournal` 域
- 兼容 biblatex 的 `location` 域

## [v2.0.2] - 2020-06-08
### Changed
- 期刊的页码前默认有空格（#62）

### Added
- 支持预印本（preprint）文献类型

## [v2.0.1] - 2020-03-14
### Added
- 新增选项 `only.start.page`
- 增加选项 `title.in.journal`
- 增加选项 `abbreviate.journal`
- 增加选项 `show.english.translation`

### Fixed
- 修正 DOI 中含有下划线的问题

## [v2.0] - 2020-03-04
### Changed
- 需要用户在主文档使用 `\bibliographystyle` 命令
- 更改 `bst` 文件名为 `-numerical` 和 `-author-year`
- 不再默认对顺序编码制的引用标注进行排序

### Added
- 兼容 `chapterbib` 宏包（#48）

## [v1.1.2] - 2019-11-20
### Changed
- 不再依赖 `etoolbox`

### Fixed
- 修正与 `newtx` 冲突（[#42](https://github.com/CTeX-org/gbt7714-bibtex-style/issues/42)）

## [v1.1.1] - 2019-03-21
### Added
- 允许自定义文种的顺序

## [v1.1] - 2019-01-02
### Added
- 允许自定义“et al”

### Changed
- 修正 series 的 bug

## [v1.0.9] - 2018-08-05
### Added
- 增加选项在题名添加超链接

### Changed
- 不再转换题名 volume 的大小写
- 修正不显示 url 的选项

## [v1.0.8] - 2018-06-23
### Added
- 新增接口供用户自定义样式
- 支持 howpublished 中的 url

### Changed
- 使用 `xurl` 的方法改进 URL 断行
- 使用“~”连接英文姓名

## [v1.0.7] - 2018-05-12
### Changed
- 修正了检测 Unicode 语言

## [v1.0.6] - 2018-05-10
### Changed
- 文献列表的数字标签左对齐
- 不再处理中文标题的英文单词的大小写

## [v1.0.5] - 2018-04-18
### Added
- 允许著录多个 DOI

## [v1.0.4] - 2018-04-12
### Changed
- 页码的连接号由 en dash 改为 hyphen

## [v1.0.3] - 2018-03-29
### Changed
- 顺序编码制连续两个文献引用之间使用连接号

## [v1.0.2] - 2018-03-16
### Changed
- 正确识别姓名中的“others”

## [v1.0.1] - 2018-03-09
### Changed
- 著者出版年制的文献引用不再排序

## [v1.0] - 2018-01-01
### Changed
- Initial release.

[Unreleased]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v2.0.2...HEAD
[v2.0.2]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v2.0.1...v2.0.2
[v2.0.1]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v2.0...v2.0.1
[v2.0]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.1.2...v2.0
[v1.1.2]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.1.1...v1.1.2
[v1.1.1]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.1...v1.1.1
[v1.1]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.9...v1.1
[v1.0.9]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.8...v1.0.9
[v1.0.8]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.7...v1.0.8
[v1.0.7]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.6...v1.0.7
[v1.0.6]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.5...v1.0.6
[v1.0.5]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.4...v1.0.5
[v1.0.4]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.3...v1.0.4
[v1.0.3]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.2...v1.0.3
[v1.0.2]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0.1...v1.0.2
[v1.0.1]: https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.0...v1.0.1
[v1.0]: https://github.com/CTeX-org/gbt7714-bibtex-style/releases/tag/v1.0
