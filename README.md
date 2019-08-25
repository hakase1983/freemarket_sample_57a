# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|-------|
|profile|text|-------|
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
|birth_day|string|--------------|

### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :sellers
- has_many :buyers
- has_many :bought_items, foreign_key: "buyer_id"
- has_many :selling_items, -> {where("buyer_id is NULL") }, foreign_key: "seller_id"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id"


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image_id|references|null: false, foreign_key: true|
|description|text|null: false|
|first_category_id|references|null: false, foreign_key: true|
|second_category_id|references|null: false, foreign_key: true|
|third_category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|condition|string|null: false|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|


### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :size
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- has_many :comments
- has_many :likes
- has_one :seller
- has_one :buyer
- has_one :delivery
- has_one :dealing
- has_one :image

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
|item_id|string|----------|

### Association
- belongs_to :item


## first_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :second_categories


## second_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :first_category
- has_many :items
- has_many :third_categories


## third_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :second_category
- has_many :items


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

### Association
- has_many :items


## deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|fee|string|null: false|
|area|string|null: false|
|delivery_days|string|null: false|
|item_id|references|null: false, foreign_key: true|

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


## sellersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## buyersテーブル

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
