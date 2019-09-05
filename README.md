# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|-------|
|profile|text|-------|


### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :bought_items, foreign_key: "buyer_id",class_name: "Item"
- has_many :selling_items, -> {where("buyer_id is NULL") }, foreign_key: "seller_id",class_name: "Item"
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
|birth_day|date|--------------|
|user_id|references|null: false, foreign_key :true|
### Association
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image_id|references|null: false, foreign_key: true|
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
- has_one :seller
- has_one :buyer
- has_one :delivery
- has_one :dealing
- has_one :image
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image1|string|null: false|
|image2|string|-----------|
|image3|string|-----------|
|image4|string|-----------|
|image5|string|-----------|
|image6|string|-----------|
|image7|string|-----------|
|image8|string|-----------|
|image9|string|-----------|
|image10|string|----------|
|item_id|references|----------|

### Association
- belongs_to :item
- mount_uploader :image1, ImageUploader
- mount_uploader :image2, ImageUploader

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


## dealingsテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

## Association
- belongs_to user