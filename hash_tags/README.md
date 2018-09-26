# 概要

ハッシュタグをパースする正規表現

## `\s` を使うと全角空白が残る

```bash
$ cat text | ruby -ne 'p $_.scan(/#[^#\s]+/)'
["#タグ", "#タグ", "#タグ", "#たぐ", "#tag", "#たぐ"]
["#たぐ", "#タグ　", "#たぐ", "#🐧"]
```

## `[:space:]` を使えば全角空白を取り除ける

```bash
$ cat text | ruby -ne 'p $_.scan(/#[^#[:space:]]+/)'
["#タグ", "#タグ", "#タグ", "#たぐ", "#tag", "#たぐ"]
["#たぐ", "#タグ", "#たぐ", "#🐧"]
```

## `\s` と `[:space:]` の違い

Onigumo のドキュメント

Unicode の場合

- \s
  - 0009, 000A, 000B, 000C, 000D, 0085(NEL)
  - Line_Separator
  - Paragraph_Separator
  - Space_Separator
  - ASCII外の文字を含むかどうかは `ONIG_OPTION_ASCII_RANGE` オプションに依存する。
- [:space:]
  - 0009, 000A, 000B, 000C, 000D, 0085(NEL)
  - Line_Separator
  - Paragraph_Separator
  - Space_Separator
  - ASCII外の文字にマッチするかどうかは `ONIG_OPTION_ASCII_RANGE` オプションと `ONIG_OPTION_POSIX_BRACKET_ALL_RANGE` オプションに依存する。

Ruby のドキュメント

- \s
  - 空白文字 [ \t\r\n\f\v]
- [:space:]
  - 空白、改行、復帰 (Space_Separator | Line_Separator | Paragraph_Separator | 0009 | 000A | 000B | 000C | 000D | 0085)

おそらく `ONIG_OPTION_ASCII_RANGE` がオンで `ONIG_OPTION_POSIX_BRACKET_ALL_RANGE` がオフ

## ONIG_OPTION_ASCII_RANGE をオフにすると `\s` でも全角空白にマッチする

```ruby
"#タグ　".scan(/(?u)#[^#\s]+/)
=> ["#タグ"]
```
