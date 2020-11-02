# FurimaのER図

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
|email     |string  |not null     |
|password  |string  |not null     |
|name      |string  |not null     |
|profile   |text    |not null     |
|address   |text    |not null     |
|birthday  |text    |not null     | 

## itemsテーブル

| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|title     |string      |not null     |
|category  |text        |not null     |
|image     |ActibeStrage|not null     |
|user      |references  |not null     |
|condition |text        |not null     |

## commmentsテーブル

| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|text      |text        |not null     |
|user      |references  |not null     |
|furima    |refernces   |not null     |

