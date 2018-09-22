# Ruby の正規表現の歴史

TBD

# Ruby の正規表現の書き方

- `//`
  - 正規表現リテラル
- `Regexp.new`
  - 正規表現クラス
- `%r{}`
  - ％記法

## 正規表現を扱うメソッド

- [String#=~](https://docs.ruby-lang.org/ja/latest/method/String/i/=3d=7e.html)
- [String#scan](https://docs.ruby-lang.org/ja/latest/method/String/i/scan.html)
- [String#match](https://docs.ruby-lang.org/ja/latest/method/String/i/match.html)
- [String#match?](https://docs.ruby-lang.org/ja/latest/method/String/i/match=3f.html)
- [String#[]](https://docs.ruby-lang.org/ja/latest/method/String/i/=5b=5d.html)
- [String#slice!](https://docs.ruby-lang.org/ja/latest/method/String/i/slice=21.html)
- [String#index](https://docs.ruby-lang.org/ja/latest/method/String/i/index.html)
- [Regexp](https://docs.ruby-lang.org/ja/latest/class/Regexp.html)

### `require 'strscan'` 

- [StringScanner#check](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/check.html)
- [StringScanner#check_until](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/check_until.html)
- [StringScanner#exist?](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/exist=3f.html)
- [StringScanner#match?](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/match=3f.html)
- [StringScanner#scan](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/scan.html)
- [StringScanner#scan_full](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/scan_full.html)
- [StringScanner#scan_until](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/scan_until.html)
- [StringScanner#search_full](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/search_full.html)
- [StringScanner#skip](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/skip.html)
- [StringScanner#skip_util](https://docs.ruby-lang.org/ja/latest/method/StringScanner/i/skip_util.html)

# 参考

## ドキュメント

[正規表現](https://docs.ruby-lang.org/ja/latest/doc/spec=2fregexp.html)
[Regexpクラス](https://docs.ruby-lang.org/ja/latest/class/Regexp.html)
[%記法](https://docs.ruby-lang.org/ja/latest/doc/spec=2fliteral.html#percent)

## 実装

[鬼雲](https://github.com/k-takata/Onigmo/)

## MISC

[鬼雲に非包含オペレータを実装した話](https://qiita.com/k-takata/items/4e45121081c83d3d5bfd)