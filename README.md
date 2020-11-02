# FurimaのER図

## usersテーブル
| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
|email               |string  |not null     |
|encrypted_password  |string  |not null     |
|fastname             |string  |not null     |
|secondname          |string  |not null     |
|fastname_kana        |string  |not null     |
|secondname_kana     |string  |not null     |
|birthday            |date    |not null     | 

### Association
* has_many :sitems
* has_many :citems
* has_many :address




## sitemsテーブル
| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|name      |string      |not null     |
|exposition|text        |not null     |
|category_id(active_hash)|integer     |not null     |
|condition_id(active_hash) |integer    |not null     |
|charge_id(active_hash)    |integer     |not null     |
|area_id(active_hash)      |integer     |not null     |
|days_id(active_hash)      |integer     |not null     |
|price     |integer     |not null     |

### Association
- belongs_to :users



## citemsテーブル
| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|user      |integer     |foreign_key: true     |
|price     |integer     |not null     |

### Association
- belongs_to :users




## address
| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|postal_code|integer    |not null     |
|prefectures|string     |not null     |
|municipality|string    |not null     |
|address   |string      |not null     |
|building_name|string   |not null     |
|phoen     |integer     |not null     |

### Association
- belongs_to :users


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
|商品名 Ok
|商品説明 ok
|カテゴリー (値が変わらない物) OK
|品質       (値が変わらない物) OK
|配送料の負担 ok
|地域 ok
|日数 ok
|価格   OK -->


<!-- ## 購入itemsテーブル

|商品名
|画像
|価格
|ユーザー -->

<!-- ## 住所テーブル

|郵便番号
|都道府県（値が変わらない物）
|市区町村
|番地
|建物名
|電話番号 -->