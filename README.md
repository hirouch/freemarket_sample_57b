# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|integer|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kan|string|null: false|
|birthdate_year|integer|null: false|
|email|string|null: false|
|encrypted-pasword|-------|
|reset_password_token|string|-------|
|reset_password_sent_at|string|-------|
|birthdate_yea|string|null: false|
|birthdate_day|string|null: false|
|phone_number|string|null: false|
|address_last_name|string|null: false|
|address_first_name|integer|null: false|
|address_last_name_kana|string|null: false|
|address_first_name_kana|string|null: false|
|address|string|null: false|
|address_number|integer|null: false|
|address_prefecture|integer|null: false|
|address_name|string|null: false|
|address_block|string|null: false|
|address_building|-------|
|address_phone_number|-------|
|introduce|text|-------|
|encrypted_password|string|null: false|


### Association
has_many :buyer_transactions, class_name: 'Transaction', :foreign_key => 'buyer_id'
has_many :seller_transactions, class_name: 'Transaction', :foreign_key => 'seller_id'
has many :items


#itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|image|string|null:false|
|description|text|-------|
|category|references|foreign_key: true|
|size|string|-------|
|brand|string|-------|
|state|string|-------|
|postage|integer|null:false|
|region|string|-------|
|shipping_date|date|null:false|
|price|integer|null:false|
|seller_id|references|foreign_key|
|buyer_id|references|foreign_key|

##Association
- belongs_to :seller, class_name: ‘User’, :foreign_key => ‘seller_id’
- belongs_to :buyer, class_name: ‘User’, :foreign_key => ‘buyer_id’

#categoryテーブル
|name|string|-------|
|ancestry|string|-------|

- hasmany :item
