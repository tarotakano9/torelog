# README

## アプリケーション名
TORELOG(トレログ)

## 概要
トレーニング記録の保存、確認を行うためのアプリ
### 期待効果
成長・成果の見える化を行うことで、ユーザーのトレーニングに対するモチベーション維持と効率化を実現する
### 課題解決

## URL
https://torelog.herokuapp.com/
### テスト用アカウント
・ニックネーム : テストユーザー<br>
・パスワード : testpass2021

## 要件定義

### 今後実装予定の機能

## 利用方法
### ユーザー管理機能
#### 新規ユーザー登録
#### ログイン
#### ログアウト
#### ユーザー削除
### トレーニング記録機能
#### 新規登録
#### 確認
#### 検索
#### 編集
##### トレーニング実施日
##### トレーニング記録
#### 削除
##### トレーニング実施日
##### トレーニング記録
##### 全削除

## テーブル設計
### ER図
![Test Image 1](er.png)

### usersテーブル
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false, unique: true | 
| encrypted_password | string | null: false               | 

#### Association
has_many :days, dependent: :destroy

### daysテーブル
| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| date          | date       | null: false                    | 
| chest         | boolean    |                                | 
| shoulder      | boolean    |                                | 
| tricep        | boolean    |                                | 
| bicep         | boolean    |                                | 
| back          | boolean    |                                | 
| abdominal     | boolean    |                                | 
| leg           | boolean    |                                | 
| user_id       | references | null: false, foreign_key: true | 

#### Association
belongs_to :user<br>
has_many :logs, dependent: :destroy
accepts_nested_attributes_for :logs, reject_if: :all_blank, allow_destroy: true

### logsテーブル
| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ | 
| training | string     | null: false                    | 
| weight   | float      | null: false                    | 
| rep      | integer    | null: false                    | 
| day_id   | references | null: false, foreign_key: true | 

#### Association
belongs_to :day

## ローカルでの動作方法
