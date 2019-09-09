# README


## usersテーブル

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
|introduce|text|-------|
|encrypted_password|string|null: false|


### Association
- has_many :buyer_transactions, class_name: 'Transaction', :foreign_key => 'buyer_id'
- has_many :seller_transactions, class_name: 'Transaction', :foreign_key => 'seller_id'
- has_many :items
- has_one   :card
- has_one  :address

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|image|string|null:false|
|description|text|null:false|
|category|references|foreign_key: true|
|state|string|null:false|
|size|string|-------|
|brand|string|-------|
|postage|string|null:false|
|region|string|null:false|
|shipping_date|string|null:false|
|price|integer|null:false|
|seller_id|integer|-------|
|buyer_id|integer|-------|

## Association
- belongs_to :seller, class_name: ‘User’, :foreign_key => ‘seller_id’
- belongs_to :buyer, class_name: ‘User’, :foreign_key => ‘buyer_id’

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

## association
- belongs_to :item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|-------|
|ancestry|string|-------|

## association
- has_many :item



## addressesテーブル

|Column|Type|Options|
|------|----|-------|
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

### Association
- belongs_to user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false foreign_key: true|
|costomer_id|	integernull: false|
|card_id|integer|null: false|

## Association
- belongs_to user


