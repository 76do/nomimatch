# README

### ■ サービス名
ノミマチ！

### ■ サービス概要
上司を飲みに誘いたい若手社員と  
ハラスメントを気にして若手社員を飲みに誘えない上司を  
マッチングするサービスです  

### ■メインのターゲットユーザー
- 20代　若手社員
    - 上司を飲みに誘いたいと考えている若手社員
- 30代後半以降の上司層
    - ハラスメントに過敏になって若手社員を飲みに誘えない上司

### ■ユーザーが抱える課題
- 若手社員側の課題
    - 上司を飲みに誘う勇気がない。
    - 飲みには行きたいが早めに帰りたい。騒がしい飲み会は嫌だ、静かにしっぽりした飲み会がいい。しかし、上司に気をつかってしまいそのことを本人に伝えづらい。
- 上司側の課題
    - 誰が飲みに行きたがっているのかわからない。無理に誘うのは避けたいので、飲みに行きたいと思っている人を把握したい。
	- どんな飲み会をしたいのか把握したい。

### ■解決方法
サービス内で以下3つを実現し、上記課題を解決する。

- 若手社員から上司へ飲み会依頼を送信する。飲み会依頼のメッセージには飲み会の詳細（解散時間や人数、飲み会の雰囲気等）を記載できる。
- 飲み会依頼送信後、送信者と受信者でチャットをすることができる。
- 上司側は飲み会依頼一覧を確認できる。

### ■実装予定の機能（以下の例は実際のアプリの機能から一部省略しています）
- 未登録ユーザー
    - トップ画面表示
	- 飲み会依頼を送信できる。（チャットは不可）
- 登録ユーザー
    - ログイン ログアウト機能(メール)
	- 自分宛の飲み会依頼フォーム入力画面へのリンクを発行できる。(リンクをクリックすると登録ユーザー宛の飲み会依頼フォーム入力画面へ遷移する。未登録ユーザーはリンクから飲み会依頼を送信できる。)
	- Twitter連携したユーザーは上記リンクを本サービスからTwitter上に投稿することができる。
	- チャット機能ありの飲み会依頼を送信できる。
    - フォームで飲み会の詳細（希望解散時間・希望人数・飲み会の雰囲気・店のURL・フリー記述）を記載することができる。フォームの入力内容から飲み会依頼メッセージを作成する。
    - 飲み会依頼メッセージはメールで送信される。
	- 登録ユーザー宛に届いた飲み会依頼メッセージ一覧をマイページで確認できる。
    - 飲み会依頼メッセージを送った相手とチャットをすることができる。（送信者、受信者ともに登録ユーザーの場合に可能)
- 管理ユーザー
    - 全ユーザーの一覧、詳細、削除
    - 全チャットの一覧、詳細、削除
    - 全依頼情報の一覧、詳細、削除

### ■なぜこのサービスを作りたいのか？
私は仕事をする上で、上司や同僚と良い関係性を築くことは大切だと考えています。  
そして、関係を築く手段として飲み会はとても有用だと思います。  
しかし、若手社員が上司を飲みに誘うのはハードルが高く、また、上司層はハラスメントに敏感になり、若手社員を飲みに誘いづらくなっているため、飲み会開催が難しくなっている現状があると思います。  
私自身、上司を飲みに誘いたいと思ったことが何度かありましたが、誘う勇気がでない、また、飲みに行きたいが終電以降まで連れ回されるのは嫌だ等の理由で上司を誘えずにいた経験があります。  
私の直属の上司も新卒の女の子の歓迎会を開いてあげたいが、ハラスメントと言われないか悩み歓迎会を開けずにいました。  
そこで、上記課題を解決し、少しでも多くの人が飲み会を楽しみ、そこで築いた関係性の上で楽しく仕事ができるようにしたいと思いました。  

### ■スケジュール
▼スケジュール例
企画〜技術調査：12/28〆切
README〜ER図作成：1/8〆切
メイン機能実装：1/9 - 2/23〆切
β版をRUNTEQ内リリース（MVP）：2/23〆切
本番リリース：3/31〆切

### ■画面遷移図
[画面遷移図](https://www.figma.com/file/tvDbdZaatlwxrx1UqF9Swe/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1&t=LPLOMbFnbDYnwbZC-1)

### ■ER図
<img width="855" alt="スクリーンショット 2023-01-05 21 58 04" src="https://user-images.githubusercontent.com/86270681/210786346-f978fa52-1976-4812-a49f-3a885236c3b7.png">
