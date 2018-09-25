# 概要

http://www.geocities.jp/oraclesqlpuzzle/regex/index.html を解いてくディレクトリ

## 2-1

abを含んで、かつ、bcを含んで、かつ、cdを含む行を検索する。

`grep` `grep` `grep` するやつ。

```bash
cat 2-1.txt | grep ab | grep bc | grep cd
```

`(?=.*ab)` がマッチしうる行かつ `(?=.*bc)` がマッチしうる行かつ `(?=.*cd)` がマッチしうる行

```ruby
cat 2-1.txt | ruby -pe '$_="" unless $_[/(?=.*ab)(?=.*bc)(?=.*cd)/]'
```

## 2-2

abを含まない、かつ、bcを含まない、かつ、cdを含む行を検索する。

`grep -v` `grep -v` `grep` するやつ。

```bash
cat 2-2.txt | grep -v 'ab' | grep -v 'bc' | grep 'cd'
```

`(?=.*ab)` がマッチしえない行かつ `(?=.*bc)` がマッチしえない行かつ `(?=.*cd)` がマッチしうる行

```bash
cat 2-2.txt | ruby -pe '$_="" unless $_[/^(?!.*ab)(?!.*bc)(?=.*cd)/]'
```

## 2-3

整数をカンマ区切りに置換する


## 2-4

URLの最後の/を補完する。
(最後に/があればそのままで、最後に/がなければ追加する)


