# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|image|string|-------|
|profile|text|-------|
|birth_day|date|--------------|


### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :bought_items, foreign_key: "buyer_id",class_name: "Item"
- has_many :selling_items, -> {where("buyer_id is NULL") },     foreign_key: "seller_id",class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id",class_name: "Item"
- has_one :personal_info
- has_many :cards


## personal_infosテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture_code|string|null: false|
|city_code|string|null: false|
|address_num|string|null: false|
|building_name|string|----------|
|telephone|string|--------------|
|user_id|references|null: false, foreign_key :true|
### Association
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|condition|string|null: false|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|



### Association
- belongs_to :user
- belongs_to :brand
- has_one :size
- belongs_to :category
- has_many :comments
- has_many :likes
- has_one :delivery
- has_one :dealing
- has_many :image
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|----------|

### Association
- belongs_to :item
- mount_uploader :name, ImageUploader

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
- has_many :items
- has_ancestry


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|-------|

### Association
- has_many :items


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- has_many :items


## deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|fee|string|null: false|
|area|string|null: false|
|delivery_days|string|null: false|
|item_id|references|null:false, foreign_key: true|

### Association
- belongs_to :item


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|---------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

## Association
- belongs_to user