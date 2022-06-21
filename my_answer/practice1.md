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
