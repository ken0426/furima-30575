# FurimaのER図

## usersテーブル
| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
|email               |string  |not null     |
|encrypted_password  |string  |not null     |
|fastname            |string  |not null     |
|secondname          |string  |not null     |
|fastname_kana       |string  |not null     |
|secondname_kana     |string  |not null     |
|birthday            |date    |not null     | 

### Association
* has_many :sitems
* has_many :citems



## sitemsテーブル(出品テーブル)
| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|name      |string      |not null     |
|exposition|text        |not null     |
|category  |integer     |not null     |
|condition |integer     |not null     |
|delivery  |integer     |not null     |
|area      |integer     |not null     |
|price     |integer     |not null     |

### Association
- belongs_to :user
* has_one :citems



## citemsテーブル（購入テーブル）
| Column   | Type       | Options         |
| -------- | -----------| --------------- |
|sitem     |references  |foreign_key: true|
|user      |references  |foreign_key: true|

### Association
- belongs_to :user
* has_one :address



## address（住所）
| Column     | Type       | Options     |
| ---------- | -----------| ----------- |
|postalcode  |integer     |not null     |
|prefecture  |string      |not null     |
|municipality|string      |not null     |
|address     |string      |not null     |
|building    |string      |             |
|phoen       |string      |not null     |


### Association
- belongs_to :citem