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
