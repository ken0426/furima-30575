# FurimaのER図

## usersテーブル

| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
|email               |string  |not null     |
|encrypted_password  |string  |not null     |
|fastnam             |string  |not null     |
|secondname          |string  |not null     |
|address             |text    |not null     |
|birthday            |text    |not null     | 

## itemsテーブル

| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|title     |text        |not null     |
|category  |text        |not null     |
|image     |ActibeStrage|not null     |
|user      |text        |not null     |
|condition |text        |not null     |
|charge    |text        |not null     | 
|area      |text        |not null     |
|days      |text        |not null     |
|exposition|text        |not null     |
|price     |text        |not null     |

## commmentsテーブル

| Column   | Type       | Options     |
| -------- | -----------| ----------- |
|text      |text        |not null     |
|user      |references  |not null     |
|furima    |refernces   |not null     |

