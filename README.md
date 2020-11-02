# FurimaのER図

## usersテーブル

| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
|email               |string  |not null     |
|encrypted_password  |string  |not null     |
|fastnam             |string  |not null     |
|secondname          |string  |not null     |
|fastnam_kana        |string  |not null     |
|secondname_kana     |string  |not null     |
|birthday            |date    |not null     | 

## 出品itemsテーブル

| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|title     |text        |not null     |
|category(active_hash)  |text        |not null     |
|image     |ActibeStrage|not null     |
|user      |text        |not null     |
|condition(active_hash) |text        |not null     |
|price     |text        |not null     |

## 購入itemsテーブル

| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|title     |text        |not null     |
|image     |ActibeStrage|not null     |
|user      |text        |not null     |
|price     |text        |not null     |
|address   |text        |not null     |



<!-- ## usersテーブル

| Column 
|メール
|パスワード
|苗字 
|下の名前 
|苗字読み方
|下の名前読み方
|生年月日  -->

<!-- ## 出品itemsテーブル

| Column 
|商品名
|カテゴリー (値が変わらない物)
|画像
|ユーザー
|品質       (値が変わらない物)
|価格   -->


<!-- ## 購入itemsテーブル

|商品名
|画像
|価格
|ユーザー
|住所 -->