users

| 属性の意味     | カラム名     | 型      | その他(null、ユニーク、デフォルト値) |
| -------------- | ------------ | ------- | ------------------------------------ |
| ID連番         | id      | int     | not_null,uniq                        |
| 名前           | name    | string  | not_null                             |
| メールアドレス | email         | string    | uniq                                 |
| 管理者かどうか | admin_fg     | boolean | not_null,defalut:false                        | 


questions

| 属性の意味    | カラム名     | 型      | その他(null、ユニーク、デフォルト値)  |
|----------| ------------ | ------- |------------------------|
| ID連番     | id      | int     | not_null,uniq          |
| questionsとの紐付けFK       | user_id    | int  | not_null               |
| 質問タイトル   | title        | string | not_null               | 
| 質問詳細     | detail       | text   |                        | 
| 質問のステータス | status       | int   | 0:未解決,1:解決済み　defalut:0 | 


answers

| 属性の意味            | カラム名     | 型     | その他(null、ユニーク、デフォルト値) | 
| --------------------- | ------------ | ------ | ------------------------------------ | 
| ID連番                | id    | int    | not_null,uniq                        | 
| usersとの紐付けFK     | user_id      | int    | not_null                             | 
| questionsとの紐付けFK | questions_id | int    | not_null                             | 
| 答えタイトル          | title        | string | not_null                             | 
| 答え詳細              | detail       | text   |                                      | 
