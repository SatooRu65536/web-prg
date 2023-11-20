## p.112
### Q.1
> 以下のコードを実行したときに出力されるのはAとBのどちらですか？

```js
const year = 2021;
if (year < 2001) {
  console.log('A');
} else {
  console.log('B');
}
```

### 解答
`B`

### Q.2
> 以下の条件を満たすコードを書いてください。
> - もし変数ageが18なら「新成人」と出力
> - もし変数ageは18より上なら「成人」と出力
> - 上記以外なら「未成年」と出力

### 解答
```js
const age = 18;
if (age === 18) {
  console.log('新成人');
} else if (age > 18) {
  console.log('成人');
} else {
  console.log('未成年');
}
```


## p.116
### Q.1
> 以下の条件を満たす条件式を選んでください。  
>> 条件 変数priceが500以上かつ1000未満
>> A. (price >= 500 && price < 1000)  
>> B. (500 <= price < 1000)  
>> C. (price >= 500 || price < 1000)  

### 解答
`(price >= 500 && price < 1000)`


## p.122
### Q.1
> 以下のi文を三項演算子を使って書き換えてください。

```js
const a = 5;
const b = 3;
let c;
if (a <= b) {
    c = a;
} else {
    c = b;
}
```

### 解答
```js
const a = 5;
const b = 3;
const c = a <= b ? a : b;
```
