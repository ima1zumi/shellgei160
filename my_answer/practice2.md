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
