## 2.1.a

```bash
gsed 2> a
```

`2>` で stderr からリダイレクトできる。
0, 1, 2 がそれぞれ 標準入力、標準出力、標準エラー出力

## 2.1.b

```bash
echo $SHELL
```

## 2.1.c

```bash
bash-3.2$ c=$a$b; echo $c
私は俳優よ
bash-3.2$ a+=$b; echo $a
私は俳優よ
bash-3.2$ b=${a:0:1}${a:2:2};echo $b
私俳優
bash-3.2$ c=${a/優/骨麺}; echo $c;
私は俳骨麺よ
```

シェルの変数展開は柔軟
https://qiita.com/t_nakayama0714/items/80b4c94de43643f4be51

## 2.1.d

```bash
echo $((a+b)) $((b-a)) $((a*b)) $((a/b)) $((b**a*b))
```

最後は `$b<<$a` でも良かった
シフト演算か〜ぱっと出てこない

## 2.1.f

こうなってしまいよくわからなくなってskip

```bash
bash-3.2$ declare -a b
bash-3.2$ b["SHELL"]="$SHELL"
bash: /usr/local/bin/zsh: syntax error: operand expected (error token is "/usr/local/bin/zsh")
```

## 2.1.g

```bash
bash-3.2$ for x in "$1" "$2" "$3"; do echo $x; done
aa
bb
cc
bash-3.2$ seq 3 | while read x ; do echo -n "${x} " ; done
1 2 3 bash-3.2$ a=0
```

xargs に渡そうとしたけどうまくできずechoの改行なしオプションを使った

## 2.1.h

```bash
if test $((${a}%2)) -eq 0; then echo 偶数; elif test $((${a}%2)) -ne 0 ; then echo 奇数; else echo その他; fi
```

数が少ないから計算しなくても良かった。
testコマンドは `[]` というショートカットがある。bash scriptでたまにみるやつだ

## question 12

```bash
if [ $# == 1 ]; then
  echo $(($1 * 2))
else
  read line
  echo $((line * 2))
fi
```

## question 13

```bash
if [ -f $1 ] ; then
  cat $1
else
  touch $1 && cat $1
fi
```

問題の意図がよくわからなかった

## 2.2.a

```bash
bash-3.2$ ps | awk '{if($4=="sleep"){print $1}}' | uniq -u | wc
```

## 2.2.d

A. サブシェルは別プロセスで動くから
