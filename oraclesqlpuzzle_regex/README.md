# 概要

http://www.geocities.jp/oraclesqlpuzzle/regex/index.html を解いてくディレクトリ

## 2-1

abを含んで、かつ、bcを含んで、かつ、cdを含む行を検索する。

```ruby
cat 2-1.txt | ruby -pe '$_="" unless $_.match(/(?=.*ab)(?=.*bc)(?=.*cd)/)'
```

```bash
cat 2-1.txt | grep ab | grep bc | grep cd
```

## 2-2

abを含まない、かつ、bcを含まない、かつ、cdを含む行を検索する。

```bash
cat 2-2.txt | grep -v 'ab' | grep -v 'bc' | grep 'cd'
```

