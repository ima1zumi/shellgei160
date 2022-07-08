## 1.3.d

```bash
# 1
seq 5 | awk '/2|4/'

# 2
seq 5 | awk '$1%2==0'

# 3
seq 5 | awk '$1%2==0{printf($1" 偶数\n")}'

# 4
seq 5 | awk '$1%2==0{printf($1" 偶数\n")}$1%2!=0{printf($1" 奇数\n")}'

#5

seq 5 | awk 'BEGIN{a=0}$1%2==0{print $1,"偶数"}$1%2!=0{print $1,"奇数"}{a+=$1}END{print "合計 ",a,"\n"}'
```

## 1.3.e

```bash
seq 5 | awk '$1%2==0{printf("偶数\n")}$1%2!=0{printf("奇数\n")}' | sort | uniq -c
```

## 1.3.f

```bash
# 1
seq 4 | xargs mkdir $1

# 2
seq 4 | xargs rmdir $1

# 3
seq 4 | xargs -n2 mv $1 $2

# 4
seq 4 | xargs -I@ echo dir_@
```

## 1.3.g

```bash
# 1
seq 4 | awk '$1%2==0{print "mkdir even_" $1}$1%2!=0{print "mkdir odd_" $1}' | bash

# 模範解答
seq 4 | awk '{print "mkdir " ($1%2 ? "even_" : "odd_") $1}'
```

## 1.4.a
```bash
find . | grep files
```

## 問題1
```bash
cat files.txt | grep -e '\.exe$'

# 模範解答
grep '\.exe$' files.txt
```

## 問題2
```bash
ls *.png | awk '{{str=$1}gsub("png", "jpg", $1); print str, "./converted/"$1}' | xargs -n 2 convert

# 模範解答
# sedでPNGファイルから拡張子を取り除き、xargsに引き渡す
ls *.png | sed 's/\.png$//' | xargs -I@ convert @.png @.jpg
```

## 問題3
```bash
ls -1 | awk '{printf "%d %07d ", $1, $1}' | xargs -n2 mv
```

## 問題4
```bash
rg -l ^10$ | xargs rm
```

## 問題5
```bash
cat qdata/5/ntp.conf | awk '$1=="pool"{print $2}'
```

## 問題6
```bash
echo | awk '{for (i = 4; i >= 0; i--) {str=substr("    ", 0, i); print str "x" }}'
```

## 問題7
```bash
cat qdata/7/kakeibo.txt | awk '{if($1>20190931){if($2~/\*/){sum+=int($3*1.08)}else{sum+=int($3*1.1)}}else{sum+=int($3*1.08)}}END{print sum}'
```

正規表現で1.08の条件まとめてしまって三項演算子を使えばもう少しすっきりかけたなー。
`numsum` コマンド使うと `END{print sum}` が不要にできそうだった。

## 問題8
```bash
cat qdata/8/access.log | sed s/:/\\//g | sed s/\\///g | sed s/\\[.*Nov//g | awk '{$4<2017120000 ? am+=1 : pm+=1}END{print "am", am, "pm", pm}'

```

何もわからなくてsedで無理やり取り不要な箇所をとり除いた。
後ろから切り出すとよくて、

```bash
cat qdata/8/access.log | awk -F: '{print $(NF-2)}'
```

`-F:` で区切り文字をコロンにして後ろから2番目(列数-2)を取り出すとスッキリした

## 問題9

```bash
cat qdata/9/log_range.log | rg '(24/Dec/2016 (2[1-3]))|(25/Dec/2016) 0[0-3]'
```

## 問題10

```bash
cat qdata/10/headings.md | gsed '/# /a ===' | gsed '/## /a ---' | gsed -e 's/#* //g'
```

sed楽しい〜

## 問題11

```bash
cat qdata/11/gijiroku.txt | sed 's/すず/鈴木:/g' | sed 's/さと/佐藤:/g' | sed 's/やま$/山田:/g' | xargs -L2 | sed 's/ //g' | gsed -z "s/\\n/\n\n/g"
```

改行を置換するために `-z` オプションを使った。gsed で使えるぽい
sedは行単位で処理するので行の末尾を意味する `$` を使ってもよかった。`s/$/\n/` こんなかんじ。



