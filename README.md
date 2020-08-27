# README

This README would normally document whatever steps are necessary to get the
application up and running.

# アプリ名  
  Fitter

# 概要
  *新規投稿（画像1枚つけること可）
  
  *投稿編集・削除
  
  *投稿一覧の閲覧（ログインしていない状態で可）
  
  *詳細画面からコメント投稿・削除
  
  *マイページで自分の投稿一覧を確認

# 本番環境
+IPアドレス 54.150.221.35

+テストアカウント

  -nickname: test1

  -email: test1@test1.com
  
  -password: 111111

# 制作背景(意図)
  体改造のためではなく、健康管理のための筋トレをする人の、記録共有アプリを作りたいと考えて作成中です。
  実際には、コロナ禍で自宅での筋トレ中に、youtubeのコメント欄で日々の筋トレの記録を更新している人を数名見かけたことがきっかけでした。

# 使用技術(開発環境)
*Ruby'2.6.5'

*Ruby on rails'6.0.0'

*mysql2'0.4.4'

# 課題や今後実装したい機能
  今実装中ですが、お気に入り数ではなく、連続投稿の日数のランキング機能をつけたいと考えています。そのランキングをつけることによって、ユーザーがお気に入り数よりも、毎日継続で投稿できることに意識を向けて使えることを目指します。


# DB設計

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
