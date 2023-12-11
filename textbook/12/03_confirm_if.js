const result = confirm('本当に消去してよいですか？');
if (result) {
  console.log('削除しました');
} else {
  console.log('キャンセルしました');
}
