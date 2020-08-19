# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string||
|email|string|null: false|
### Association
- has_many :articles, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy


## Articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|img|string||
|user|references|null: false|
|img_id|string||
### Association
- belongs_to :user
- has_many :comments
- has_many :favorites


## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|article|references|null: false|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :article


## Favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|article|references|null: false|
### Association
- belongs_to :user
- belongs_to :article


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
