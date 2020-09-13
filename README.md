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

## ER図
[![Image from Gyazo](https://i.gyazo.com/5fb6a0d3dec6e6c0e56e5d10f7523070.png)](https://gyazo.com/5fb6a0d3dec6e6c0e56e5d10f7523070)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: ture|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :shipping_addresses, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :seller_items, class_name: "Item", foreign_key: "seller_id"
- has_many :buyer_items, class_name: "Item", foreign_key: "buyer_id"
- has_one :profile, dependent: :destroy
- has_many :likes
- has_many :sns_credentials

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|phone|integer|string: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null:false|
|card_id|string|null:false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
※ 個人情報保護のため、DBにカード情報を記録せず、pay.jpを用いて管理する。

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|text|text|null:false|
|price|integer|null:false|
|condtion_id|integer|null:false|
|prefecture_id|integer|null: false|
|postage_type_id|integer|null: false|
|days_until_shipping_id|integer|null: false|
|trading_status|string|null: false, defaut:"出品中"|
|purchase_date|timestamp|null: false|
|close_date|timestamp|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand|string||
|likes_count|integer|defaut:"0"|
### Association
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"
- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :condtion
- belongs_to_active_hash :days_until_shipping
- belongs_to_active_hash :postage_type
- belongs_to :category
- belongs_to :user, optional: true
- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string||
### Association
- has_ancestry
- has_many :items
※ ancestry は、gem ancestry 使用するため。

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null:false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- mount_uploader :url, ImageUploader

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item, counter_cache: :likes_count

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|url|string||
|url|string||
|user_id|references|foreign_key: true|
### Association
- belongs_to :user, optional: true
- has_one :profile, dependent: :destroy
- accepts_nested_attributes_for :profile
- has_many :shipping_addresses, dependent: :destroy