# bboard

シンプルな掲示板アプリです。  
https://bboard-11.herokuapp.com/

## 使用した技術

- デプロイ
    - heroku
- テスト
    - RSpec
- リンター
    - RuboCop Airbnb
- 検索
    - ransack
- ユーザー認証
    - Devise
- DB
    - PostgreSQL
- ページネーション
    - kaminari
- デザイン
    - slim
    - bootstrap
    - font-awesome-sass
    - jquery

## 概要

bboardは、カテゴライズされたスレッドにコメントを投稿する形式のシンプルな掲示板アプリです。
特徴的な機能はありませんが、使いやすい、見やすいUIを心がけて開発を進めました。

## 機能

- スレッドの作成
- スレッドへのコメント投稿、閲覧
- ウォッチリスト機能（お気に入りスレッド機能）
- スレッド検索機能
- ユーザー認証
- カテゴリー機能

## Requirement

ruby 2.5.7  
rails 5.2.3
