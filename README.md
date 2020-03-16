# OWARAIMOVE

## 概要
### 売れていないお笑い芸人とユーザーをつなぐためのサービス
売れていない芸人は現在も自ら出演するライブのチケットをSNSを使って手売りで販売しています。こちらチケットが売れ残れば自分の給料よりマイナスされていく仕組みとなっています。
また、その他にも暮らしていくためにはバイトをしたりすることによって、本来磨くはずの芸を磨くことができないというのが今の現状です。
なぜ、ライブのチケットが売ることができないかというと考えたときに芸人個々人がバラバラのSNSやお笑いに特化しているサービスがないためと考えました。
そのためお笑い芸人とライブ情報をこのサービスで管理することにより、空いている時間にすぐに検索ができ映画感覚でお笑いライブに参加していただけると考えました。

## バージョン
### Ruby 2.6.3 Rails 5.2.3

## 機能一覧
- [ ] ログイン機能
- [ ] 芸人のプロフィール作成・保存機能
- [ ] 芸人一覧表示機能
- [ ] 芸人プロフィール編集・削除機能
- [ ] おすすめ芸人検索機能
- [ ] ライブ情報の追加機能
- [ ] ライブ一覧を表示機能
  - [ ] ライブ一覧を現在時刻から近い順に表示
- [ ] ライブ情報の編集・削除機能
- [ ] ライブ検索機能
- [ ] マイページ機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] ライブ参加機能
  - [ ] 現在時刻より前のライブへの参加できない機能
- [ ] ライブ詳細機能
- [ ] ライブキャンセル機能
- [ ] SNSログイン機能
- [ ] ページネーション機能
- [ ] コメント機能
- [ ] 予定通知機能
- [ ] パスワードリセット機能

## カタログ設計
https://docs.google.com/spreadsheets/d/1Y6Y7uAKJg6z_liahHJ3a1ChUpq2w7VTjxXFTs3HpBss/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1Y6Y7uAKJg6z_liahHJ3a1ChUpq2w7VTjxXFTs3HpBss/edit#gid=1897333653

## ER図
https://docs.google.com/spreadsheets/d/1OQbAcJffI-r2NCORHJG2E-1d1NzOfpw1maJgtoCizTM/edit#gid=1948228944

## 画面遷移図
https://docs.google.com/spreadsheets/d/1cCMPHUG3pwE1PhiKEG4pNNAUILdz3uTcYGV0KcCttHM/edit#gid=887844016

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1MuVMWy9q9k4WdQSB7EAvrc-EzoijuLWXWUop5M4mgG0/edit#gid=1835977959

## 使用予定Gem
* device
* carrierwave
* mini_magick
* fog-aws
* ransack
* Kaminari
