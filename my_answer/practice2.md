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

## 2.2.e


```bash
bash-3.2$ echo ${a}を逆さにすると$(echo ${a}|rev)
きたうらわを逆さにするとわらうたき

bash-3.2$ cat <(echo ${a}) <(echo を逆さにすると) <(echo ${a}|rev)
きたうらわ
を逆さにすると
わらうたき
```

コマンド置換、プロセス置換はよくわかってない

## 問題16

```bash
n="XYZ";(for i in {A..C};do n+=$i;echo $n;done);echo $n
```

## 問題17

```bash
bash-3.2$ while read line; do echo $line; done < /etc/passwd >> ~/a
```

## 問題18
```bash
bash-3.2$ IFS=:; while read -a line; do echo ${line[6]}; done  < /etc/passwd;
```

ここまで書いて、ワンライナーでfor文の書き方わからなくて答えを見たけどワンライナーでなくてもよかった
`.` を追加してカウントアップの代わりにするのはなるほど…
unset で連想配列を消す
declare で連想配列を宣言
連想配列使えるの忘れてた

## 問題19

```bash
bash-3.2$ printf xxxx-xxxx 1<> qdata/19/cardno
```

わからなかったので模範解答を見た。問題を勘違いしてた
printf はビルトインコマンドなのか
<> で入力した部分だけ上書きができる

## 2.3.a
```bash
bash-3.2$ echo {1..5}{.txt,.bash}
1.txt 1.bash 2.txt 2.bash 3.txt 3.bash 4.txt 4.bash 5.txt 5.bash
bash-3.2$ echo {2,4,6,8,10}{.txt,.bash}
2.txt 2.bash 4.txt 4.bash 6.txt 6.bash 8.txt 8.bash 10.txt 10.bash
bash-3.2$ echo {山,上}{田,}
山田 山 上田 上
```

{2..10..2} で2から10までの数字を2個ごと出力

## 2.3.b

```bash
bash-3.2$ ls ?.txt
1.txt   2.txt   3.txt   4.txt   6.txt   7.txt   8.txt   9.txt
bash-3.2$ ls [1,2,6]5.*
15.bash 15.txt  25.txt  65.bash 65.txt
bash-3.2$ ls [^2^9].*
1.bash  1.txt   3.bash  3.txt   4.bash  4.txt   5.bash  6.bash  6.txt   7.bash  7.txt   8.bash  8.txt
```

`[!29]` とか `[^29]` でもよい

## 問題20

```bash
bash-3.2$ files="/usr/*";for filepath in $files; do if [ -d $filepath ]; then echo ${filepath:5}; fi; done
```

サブシェルを使うという手もあった

## 問題22

```bash
bash-3.2$ cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 100 | xargs -n2 -I@ echo @.@.{co.jp,com}
```

こういう問題じゃなかったけどブレース展開はつかってるからいいか

## 2.4.b

`kill -l` でシグナルの一覧を見られる

## 問題23

`kill -s 17 $$`

- macOSだとSIGSTOPの番号が違ってた
    - bash で `kill -l` すると確認できる
- zshとbashで `kill -l` の出力が違う
- `man signal` でシグナルの詳細を見られる

