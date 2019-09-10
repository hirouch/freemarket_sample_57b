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
|item_image|reference|foreign_key:true, null:false|
|category|reference|foreign_key: true, null: false|
|name|string|null:false|
|description|text|null:false|
|status|string|null:false|
|size|string|-------|
|brand|string|-------|
|postage|string|null:false|
|region|string|null:false|
|shipping_date|string|null:false|
|price|integer|null:false|
|seller_id|integer|null: false|
|buyer_id|integer|-------|

### Association
- belongs_to :seller, class_name: ‘User’, :foreign_key => ‘seller_id’
- belongs_to :buyer, class_name: ‘User’, :foreign_key => ‘buyer_id’

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|reference|foreign_key: true, null: false, type: :bigint|
|image|string|null: false|

### association
- belongs_to :item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|-------|

### association
- has_many :items


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

### Association
- belongs_to user


