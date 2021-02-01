# torelog

## テーブル設計
### ER図

### usersテーブル
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false, unique: true | 
| encrypted_password | string | null: false               | 

#### Association
has_many :days

### daysテーブル
| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| date          | date       | null: false                    | 
| target_exists | boolean    | null: false                    | 
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
has_many :logs

### logsテーブル
| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ | 
| training | string     | null: false                    | 
| weight   | float      | null: false                    | 
| rep      | integer    | null: false                    | 
| set      | integer    | null: false                    | 
| day_id   | references | null: false, foreign_key: true | 

#### Association
belongs_to :day