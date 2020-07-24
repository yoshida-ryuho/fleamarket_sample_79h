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



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|string|null: false|
|email|string|null:false, unique: true, index:true|
|point|integer|


# Association
-has_many :comments, dependent: :destroy
-has_many :favorites, dependent: :destroy
-has_many :user_evaluations
-has_many :seller_items, foreign_key: "seller_id", class_name: "items"
-has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
-has_one :profile, dependent: :destroy
-has_one :destination, dependent: :destroy
-has_one :credit, dependent: :destroy



## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|user|references|null: false, foreign_key: true|

# Association
-belongs_to :user


## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination-first_name|string|null: false|
|destination-family_name|string|null: false|
|destination-first_name_kana|string|null: false|
|destination-family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|pref|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|integer|null:false, unique: true|
|user|references|null: false, foreign_key: true|

# Association
-belongs_to :user


## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false, unique: true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user|references|null: false, foreign_key: true|

# Association
-belongs_to :user


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|evaluation|references|null: false, foreign_key: true|

# Association
-belongs_to_active_hash :evaluation
-belongs_to :user
-belongs_to :item


## items テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|references|null: false, foreign_key: true|
|condition|references|null: false, foreign_key: true|
|delivery|references|null: false, foreign_key: true|
|origin_pref|string|null: false|
|preparation_day|references|null: false, foreign_key: true|
|image|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|seller|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|
|close_date|timestamp|
|postage_burden|references|null: false, foreign_key: true|

# Association
-has_many :comments, dependent: :destroy-belongs_to :user
-has_many :favorites
-has_many :images, dependent: :destroy
-has_one :evaluation
-belongs_to :category
-belongs_to :brand
-belongs_to_active_hash :condition
-belongs_to_active_hash :delivery_id
-belongs_to_active_hash :preparation_day
-belongs_to_active_hash :postage_burden
-belongs_to :seller, class_name: "User"
-belongs_to :buyer, class_name: "User"


## brands テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

# Association
has_many :items


## images テーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|

# Association
-belongs_to :item



## favorites テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

# Association
-belongs_to :user
-belongs_to :item



## comments テーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|created_at|timestamp|null: false|

# Association
-belongs_to :user
-belongs_to :item


## categorys テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

# Association
-has_many :items
