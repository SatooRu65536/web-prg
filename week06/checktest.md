## p.131
### Q.1
> for文に指定するA, B, C の3つの役割をそれぞれ説明してください。

```js
for ([A]; [B]; [C])
```

### 解答
A: 初期化式。ループの最初に1回だけ実行される。  
B: 条件式。条件式がtrueの間、ループが繰り返される。  
C: 更新式。ループのたびに実行される。  

### Q.2
> 5から10までの数字を表示するプログラムをfor文を使って書いてください。

### 解答
```js
for (let n = 5; n <= 10; n++) {
  console.log(n);
}
```

## p.135
### Q.1
> コンソールに1, 2, 3, 4, 5, と順番に表示するプログラムをwhile文を使って書いてください。

### 解答
```js
let n = 1;
while (n <= 5) {
  console.log(n);
  n++;
}
```

## p.139
### Q.1
> for...of文の書き方で正しいものを選んでください。  
>> A. for (変数 of 配列)  
>> B. for (配列 of 変数)

### Q.2
> 以下のコードは正常に動きません。その理由を答えてください。

```js
const fruits = ['りんご', 'みかん', 'バナナ'];
for (const element of fruits) {
    element = element + '食べたい';
    console.log(element);
}
```

### 解答
for文中で、constを使用し定数として宣言しているため再代入できない。
