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

### `*?`

最短一致

```ruby
# /.*/` だと最長一致を取る
"<title>Ebisu.rb#18</title>".match(/<.*>/)
#=> #<MatchData "<title>Ebisu.rb#18</title>">

# /.*?/` だと最短一致になる
"<title>Ebisu.rb#18</title>".match(/<.*?>/)
#=> #<MatchData "<title>">

# 良く見る最短一致の書き方
"<title>Ebisu.rb#18</title>".match(/<[^>]+>/)
#=> #<MatchData "<title>">
```

### `\g<name>`

部分式呼び出し  
グループの式そのものを呼び出す

```ruby
"hogehogehoge".match(/(hoge)\g<1>\g<1>/)
#=> #<MatchData "hogehogehoge" 1:"hoge">

"hogefugahoge".match(/(hoge)\g<1>\g<1>/)
#=> nil
```

後方参照とは違う  
後方参照はマッチした文字列を呼び出す  
部分式呼び出しはグループの正規表現式そのものを呼び出す  

```ruby
# /.パジャマ/ に3連続でマッチするかどうか
"赤パジャマ青パジャマ黃パジャマ".match(/(.パジャマ)\g<1>\g<1>/)
=> #<MatchData "赤パジャマ青パジャマ黃パジャマ" 1:"黃パジャマ">

# .パジャマでマッチした文字(赤パジャマ or 青パジャマ or 黃パジャマ) に3連続でマッチするかどうか
"赤パジャマ青パジャマ黃パジャマ".match(/(.パジャマ)\k<1>\k<1>/)
#=> nil

# 青パジャマが3連続でマッチするのでOK
"赤パジャマ青パジャマ青パジャマ青パジャマ黃パジャマ".match(/(.パジャマ)\k<1>\k<1>/)
#=> #<MatchData "青パジャマ青パジャマ青パジャマ" 1:"青パジャマ">
```

### `(?~)`

非包含演算子  
特定の文字列は含まない、を記述できる  
`[^abc]` だと `a` `b` `c` のいずれでもない、の意味になるが、  
`(?~abc)` なら `abc` ではない、の意味になる

```ruby
# 先頭がabc末尾がabcで、間がabcでないのでマッチ
"abcedfabc".match(/^abc(?~abc)abc$/)
#=> #<MatchData "abcedfabc">

# 先頭がabc末尾がabcで、間もabcなのでマッチしない
"abcabcabc".match(/^abc(?~abc)abc$/)
#=> nil
```

コメントアウト文を抽出するのに便利らしい

```ruby
"/nyan/ /*😺にゃーん*/ /nyan/".match(%r{/\*(?~/\*)\*/})
=> #<MatchData "/*😺にゃーん*/">
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

メロスが走っている行を抜き出す。

```bash
# 走れメロスを取得
$ pip install aozora-cli
$ aozora content --id 1567 > merosu.txt
```

```ruby
$ cat merosu.txt | ruby -pe '$_="" unless $_[/(?=.*(?<!御馳)走)(?=.*メロス)/]
# 出力略
```

メロスが走っている文を抜き出す。

```ruby
$ cat merosu.txt | ruby -pe '$_=$_.scan(/[^。]+。/).inject(""){|o,s|o+=s[/(?=.*(?<!御馳)走)(?=.*メロス).*/].to_s}.gsub(/。/, "。\n")'
さて、メロスは、ぶるんと両腕を大きく振って、雨中、矢の如く走り出た。
走れ！　メロス。
　路行く人を押しのけ、跳《は》ねとばし、メロスは黒い風のように走った。
」メロスは走りながら尋ねた。
」その若い石工も、メロスの後について走りながら叫んだ。
最後の死力を尽して、メロスは走った。
```

### Character Property

カタカナだけ抜き出す

```ruby
"みんチャレ".match(/\p{Katakana}+/)
=> #<MatchData "チャレ">
```

絵文字を取得

```ruby
"ぐー👊ぱんち".match(/\p{Emoji}/)
#=> #<MatchData "👊">
```

Skinが設定された絵文字を取得
ここで肌の色を変えた 👊🏼 にすると

```ruby
# skin(🏼) が剥がれてしまう
"ぐー👊🏼ぱんち".match(/\p{Emoji}/)
=> #<MatchData "👊">

# skinも一緒にマッチせればOK
"ぐー👊🏼ぱんち".match(/\p{Emoji}\p{Emoji_Modifier}/)
#=> #<MatchData "👊🏼">
```

`(´°̥̥̥ω°̥̥̥｀)` の涙にマッチ

```ruby
"(´°̥̥̥ω°̥̥̥｀)".match(/\p{Combining_Mark}/)
#=> #<MatchData "̥">
```

`(´°̥̥̥ω°̥̥̥｀)` の涙を拭い去る

```ruby
"(´°̥̥̥ω°̥̥̥｀)".gsub(/\p{Combining_Mark}/, '')
=> "(´°ω°｀)"
```

# 参考

## ドキュメント

- [正規表現](https://docs.ruby-lang.org/ja/latest/doc/spec=2fregexp.html)
- [Regexpクラス](https://docs.ruby-lang.org/ja/latest/class/Regexp.html)
- [%記法](https://docs.ruby-lang.org/ja/latest/doc/spec=2fliteral.html#percent)

### Unicode

- [Emoji Properties](http://unicode.org/reports/tr51/#Emoji_Properties)

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
