# FurimaのER図

## usersテーブル
| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
|nickname            |string  |null: false  |
|email               |string  |null: false  |
|encrypted_password  |string  |null: false  |
|fastname            |string  |null: false  |
|secondname          |string  |null: false  |
|fastname_kana       |string  |null: false  |
|secondname_kana     |string  |null: false  |
|birthday            |date    |null: false  | 

### Association
* has_many :items
* has_many :orders



## itemsテーブル(出品テーブル)
| Column      | Type       | Options         |
| ----------- | -----------| --------------- |
|name         |string      |null: false      |
|exposition   |text        |null: false      |
|category_id  |integer     |null: false      |
|condition_id |integer     |null: false      |
|delivery_id  |integer     |null: false      |
|area_id      |integer     |null: false      |
|price        |integer     |null: false      |
|day_id       |integer     | null: false     |
|user         |references  |foreign_key: true|

### Association
- belongs_to :user
* has_one    :order



## ordersテーブル（購入テーブル）
| Column   | Type       | Options         |
| -------- | -----------| --------------- |
|item      |references  |foreign_key: true|
|user      |references  |foreign_key: true|

### Association
- belongs_to :user
* has_one    :address
- belongs_to :item



## address（住所）
| Column      | Type       | Options         |
| ----------- | -----------| --------------- |
|postalcode   |string      |null: false      |
|area_id      |integer     |null: false      |
|municipality |string      |null: false      |
|address      |string      |null: false      |
|building     |string      |                 |
|phone        |string      |null: false      |
|order        |references   |foreign_key: true|


### Association
- belongs_to :order