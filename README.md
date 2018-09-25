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
  - `===`
    - true/false を返す
  - `=~`
    - マッチした位置を返す

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

## 正規表現メモ

### `\k<name>`

部分式呼び出し。  
グループの式そのものを呼び出す。

```ruby
"hogehogehoge".match?(/(hoge)\k<1>\k<1>/)
#=> true
```

### 先読み後読み

住所から特定の数字を抜き出し

```ruby
"東京都渋谷区恵比寿1-8-5 東洋ビル 3階".match(/(?<=恵比寿)\S+/)
#=> #<MatchData "1-8-5">
```

`&&` のように使う

```ruby
# 東京の渋谷の恵比寿の時だけマッチ
"東京都渋谷区恵比寿1-8-5 東洋ビル 3階".match(/(?=.*東京)(?=.*渋谷)(?=.*恵比寿).*/)
#=> #<MatchData "東京都渋谷区恵比寿1-8-5 東洋ビル 3階">

# 京都の渋谷の恵比寿だとマッチしない
"京都府渋谷区恵比寿1-8-5 東洋ビル 3階".match(/(?=.*東京)(?=.*渋谷)(?=.*恵比寿).*/)
#=> nil
```

# 参考

## ドキュメント

- [正規表現](https://docs.ruby-lang.org/ja/latest/doc/spec=2fregexp.html)
- [Regexpクラス](https://docs.ruby-lang.org/ja/latest/class/Regexp.html)
- [%記法](https://docs.ruby-lang.org/ja/latest/doc/spec=2fliteral.html#percent)

## 実装

- [鬼雲](https://github.com/k-takata/Onigmo/)
- [onibi](https://github.com/namusyaka/onibi)
- [build-your-own-regex](https://github.com/nadrane/build-your-own-regex)

## MISC

- [鬼雲に非包含オペレータを実装した話](https://qiita.com/k-takata/items/4e45121081c83d3d5bfd)
- [正規表現エンジンを作ろう](https://codezine.jp/article/corner/237)
- [40行以内で正規表現エンジンを構築](https://postd.cc/build-your-own-regex/)

## ツール

- [regular expressions 101](https://regex101.com/): regex debugger でバックトラックの有無を見れる
