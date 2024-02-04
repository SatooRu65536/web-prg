#import "./template.typ" : report,  img
#show: report.with(
  subject: "Webプログラミング基礎",
  title: "Castle Datastore", 
  sub-title: "マップから城を探せるアプリ", 
  date: "2024年1月30日", 
  student-id: "k23075", 
  author: "多田隆人", 
  paper-size: "a4", 
)


= 目的
このアプリケーションは, 城好きに向けた城巡りの計画をサポートするためのWebアプリケーションである。
城好きは旅行や日々の移動の中で城に訪れる機会があり, その際は訪問予定の地域に良い城があるかを探す。
しかし日本における城は約3万箇所存在するため, 一括でまとめられたサイトがなく付近の城を探すのが大変である。
また地域名で探しても実際に訪れる位置から離れている場合があり時間が掛かる。
そこで本アプリケーションはマップ上で城の位置を示すことにより, 簡単に城の位置を知られるようにすることを目的とする。


= 機能
このアプリケーションには, トップ画面・マップ画面・編集画面がある。
また各画面のマップの表示位置・ズームレベルは同期しローカルストレージに保存されるため, ページ遷移やリロードによっても保持される。


== トップ画面
トップ画面では, 最初に訪れた人に対してアプリケーションの説明や情報を提供する。
表示される内容にはアプリケーションの概要・マップ画面へのリンク・登録情報・マーカの説明・編集方法がある。
登録情報はAPIを用いて動的に取得している。
この画面を図1に示す。

#grid(
  columns: (1fr,  1fr),  gutter: 1em,  rows: 1, 
  img(image("./images/toppage1.png", height: 150pt),  caption: "トップ画面(上部"),
  img(image("./images/toppage2.png", height: 150pt),  caption: "トップ画面(下部)")
)

== マップ画面
マップ画面では, マップ上に城の位置と規模を表示する。
スクロールやズームにより表示範囲を変更することができる。
マップ上にはマーカが表示され, クリックすることで城名が表示される。
またマーカは規模によって異なるため視覚的に区別することができる。
このマーカはAPIを使用し動的に取得することで、表示範囲内のマーカを適切な数だけ表示している。
ズームにレベルによる表示の違いを図3, 図4に示す。

// #grid(
//   columns: (1fr,  1fr,  1fr,  1fr,  1fr),  gutter: 1em,  rows: 1, 
//   img(image("./images/markers/castle-black.png",  width: 100%),  caption: "百名城・続百名城"), 
//   img(image("./images/markers/castle-red.png",  width: 100%),  caption: "特別史跡・国指定史跡"), 
//   img(image("./images/markers/castle-blue.png",  width: 100%),  caption: "市町村指定史跡"), 
//   img(image("./images/markers/castle-green.png",  width: 100%),  caption: "遺構のある城"), 
//   img(image("./images/markers/star.png",  width: 100%),  caption: "その他"), 
// )

#grid(
  columns: (1fr,  1fr),  gutter: 1em,  rows: 1, 
  img(image("./images/zoom1.png"),  caption: "ズームレベル15"), 
  img(image("./images/zoom2.png"),  caption: "ズームレベル10"), 
)


== 編集画面
編集画面では, マーカの情報の編集・追加・削除ができる。
マーカのポップアップのペンマークを押すことでそのマーカが選択される。
また, マップ上でダブルクリックすることでマーカが追加される。
編集中のマーカはアイコンが変わることで区別することができる。

マーカの情報はテキストボックスから編集することがきる。
また位置の編集はマーカをドラッグ・ドロップすることでもできる。
編集内容は送信を押すことで反映される。

スマートフォンなどの画面幅が700px以下の端末ではマップが大きく表示されるため, 編集画面を表示するためにスクロールが必要になる。
しかしマップによりスクロールができない。
そこで画面幅が700px以下の場合はマップの右下にスクロールボタンを表示することでスクロールを可能にしている。
PCの画面を図5に, iPhoneXRにおいてスクロールボタンを押す前後の各画面を図6, 図7に示す。

#img(image("./images/editpage.png",  height: 200pt),  caption: "編集画面")
#grid(
  columns: (1fr,  1fr),  gutter: 1em,  rows: 1, 
  img(image("./images/scroll-before.png", height: 200pt),  caption: "スクロールボタン押下前"), 
  img(image("./images/scroll-after.png", height: 200pt),  caption: "スクロールボタン押下後"), 
)


= まとめ
このアプリはマップから簡単に城を探せることを目的としている。
そのため城の位置をマーカで示すことで見つけやすくした。
また, 全てのマーカを表示すると動作が重くなるため, 表示範囲内のマーカのみを表示するようにした。
これにより動作が軽くなり, ユーザエクスペリエンスの向上に成功した。
またレスマートフォンなどの小さい画面でも利用できるようにスポンシブ対応し, ユーザビリティの向上にも成功した。

また, マーカの追加・編集・削除という一連の操作を実装でき, 中核となる機能を完成した。
しかし, 各城ごとの画面や各都道府県の城一覧画面がデータベースの構造上難しく実装できなかった。
そしてマーカの追加・編集・削除の際には認証が必要なく, 変更を追跡することができないといった問題がある。
これらの問題に対しては次の節で述べる。


== 改善点
今後の改善点として変更の追跡と各城・各都道府県ごとの画面の実装が挙げられる。

まず変更の追跡について述べる。
現在は認証がないため, 誰がいつ変更したかを追跡することができない。
これは Firebase Authentication 等を使用することで解決できる。認証情報を元に編集履歴を保存することで変更の追跡が可能になる。

次に各城・各都道府県ごとの画面の実装はデータベースの構造上難しく実装できなかった点について述べる。
今回はリレーショナルデータベースである Cloudflare D1 を使用した。
一定範囲内のマーカを取得することは容易である一方, 複雑な城の情報を取得することは難しく読み込み回数が増加する。
この問題は FireStore 等の NoSQL データベースを使用することで複雑な情報を管理できる。このためマーカと城の情報をそれぞれのデータベースで管理し, NoSQL データベースからマーカ情報を取得・更新することで解決できる。


= 付録
この章では本アプリケーションの開発における特徴を述べる。


== フレームワーク・ライブラリ
本アプリケーションでは複数画面を持ち, ヘッダー・フッター・マップなどの共通部分がある。
そこで Next.js を使用することで共通部分をコンポーネント化し, 開発を効率化とデザインの統一をした。
またAPI部分では Hono と Drizzle ORM を使用することで Cloudflare D1 との連携を容易にした。


== API通信部分
今回, APIとの通信に Fetch API を使用した。
Fetch API を使用することでシンプルに実装することができる。
また, 頻繁に使用するコードは関数化することで再利用性を高めた。
GETリクエストを行う関数を 図8 に示す。

#img(image("./images/code-getrequest.png",  height: 130pt),  caption: "GETリクエストを行う関数")


== レスポンシブ対応
本アプリケーションのトップ画面ではブロックに分けて表示している。
これらのブロックは画面幅が 700px 以下の場合は縦並びになるようにしている。
このレイアウトの変更は 12分割グリッド により実装を容易にした。
親要素, 子要素の CSS をそれぞれ 図9, 図10 に示す。

#grid(
  columns: (1.3fr, 1fr),  gutter: 1em,  rows: 1, 
  img(image("./images/code-parent.png"),  caption: "親要素の CSS"), 
  img(image("./images/code-child.png"),  caption: "子要素の CSS"), 
)


== デプロイ
今回このアプリケーションのフロントエンド部分は Cloudflare Pages に, 
バックエンド部分は Cloudflare Workers にデプロイした。
全て Cloudflare を使用することで管理と連携を容易にした。
また Cloudflare D1 では sqlite を使っているため, Docker等の立ち上げが不要でローカル環境での開発が容易になった。

デプロイ先は下記URLからアクセスできる。https://castles.satooru.dev/


== ローカルストレージ
ユーザはマップを移動・ズームすることで表示範囲を変更する。
再度開いた際には前回の表示範囲を保持していると便利であるため, ローカルストレージに保存することで実装した。
このコードの内、ローカルストレージからの読み込みを 図11, マップ設定の読み込みを 図12 に示す。

#img(image("./images/code-getlocalstorage.png"),  caption: "ローカルストレージからの取得")
#img(image("./images/code-mapsetting.png"),  caption: "マップ設定の読み込み")
