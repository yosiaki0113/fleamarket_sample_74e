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

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: ture|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :ship-to_addresses, dependent: :destroy
- has_many :credit_cards, dependent: :destroy
- has_many :seller_items, class_name: "Item", foreign_key: "seller_id"
- has_many :buyer_items, class_name: "Item", foreign_key: "buyer_id"
- has_one :profile, dependent: :destroy
※ user が消えると ship-o_address,credit-card,profile が消えることになる

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## ship-to_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|phone|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false|
|text|text|null:false|
|price|integer|null:false|
|condtion|string|null:false|
|prefectures|string|null: false|
|postage_type|string|null: false|
|days_until_shipping|string|null: false|
|trading_status|string|null: false|
|purchase_date|timestamp|null: false|
|close_date|timestamp|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
### Association
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"
- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
- belongs_to :brand
- belongs_to :category
- has_many :images, dependent: :destroy
※ item が消えると image が消えることになる

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|
### Association
- has_ancestry
- has_many :items
※ ancestry は、gem ancestry 使用するため。

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|URL|string|null:false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
- has_many :items
