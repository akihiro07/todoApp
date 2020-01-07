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

## memo
* AWS Cloud9環境で開発

1.  gem,bundler,ruby,railsのインストール
    * ```$ gem install bundler```
    * ```$ bundle init```=>Gemfileを作成(gemを一括管理できるツール)
    * Gemfileに```gem "rails"```と記述
    * ```$ bundle install```=> Gemfileのgem群をインストール(railsインストールされる)
1. rails開発に必要なファイルを諸々作成
    *  ```$ rails new .```
1. サーバーを起動
    * ```$ bin/rails server```(binディレクトリのrailsファイル使用)
    * cloud9でサーバー起動確認=>[参考]https://teratail.com/questions/108376
1. railsアプリ作成の環境構築
    * ```$ bin/rails generate scaffold モデル名 カラム名1:データ型1 カラム名2:データ型2 …```
    * [実際]```$ bin/rails generate scaffold todo title:string body:text status:integer```
    * generate => gに省略可能
    * モデル名は単数形
    * 実際のDBは複数形(todo->todos)で作成される(モデルDB)
    * [参考]https://maeharin.hatenablog.com/entry/20130212/rails_generate
1. Migrations(DB)を最新化する
    * ```$ bin/rails db:migrate RAILS_ENV=development```
    * =>```$ bin/rails db:migrate```と省略も可能
    * dbディレクトリ配下のschema.rbで確認
1. サーバーを起動(3. と同じ)
1. サーバーを起動したURLの最後尾にDB名追記
    * URLの最後尾に手順4.で作成したDB名(モデル名の複数形)を追記
    * [実際]手順4.でtodo(DBではtodosで作られる)を作成したので、`/todos`を記述
    * [実際]`https://a3e1235950a74c0ea84c48230e21c3e5.vfs.cloud9.us-east-1.amazonaws.com/todos`
    * ![undefined.jpg](https://s3.qrunch.io/6f84a57b6aff23ce8bab0b7bb92e1322.png)
    * ![undefined.jpg](https://s3.qrunch.io/097a5d67edc644c64ecf57af8c07126c.png)
