## 3.1.d

```bash
bash-3.2$ echo 東京タワー東京ヨワー東京スカイツリー東京ヨワイツリー | gsed -E 's/東京([^ヨ])/山本\1/g'
bash-3.2$ echo 東京タワー東京ヨワー東京スカイツリー東京ヨワイツリー | perl -pe 's/東京(?!ヨ)/山本\1/g'

bash-3.2$ echo 東京タワー東京ヨワー東京スカイツリー東京ヨワイツリー | gsed -E 's/東京..ー//'
```

最短一致

## 問題31

```bash
bash-3.2$ cat iampen.txt | perl -pe 's/(?<=<strong>).*(?=<\/strong>)/\U$&/g'
```
