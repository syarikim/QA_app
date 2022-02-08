users

| 属性の意味     | カラム名     | 型      | その他(null、ユニーク、デフォルト値) |
| -------------- | ------------ | ------- | ------------------------------------ |
| ID連番         | user_id      | int     | not_null,uniq                        |
| 名前           | user_name    | string  | not_null                             |
| メールアドレス | mail         | mail    | uniq                                 |
| アバター画像   | avataara_img | string  |                                      |
| 管理者かどうか | admin_fg     | boolean | defalut:false                        | 


questions

| 属性の意味    | カラム名     | 型      | その他(null、ユニーク、デフォルト値)  |
|----------| ------------ | ------- |------------------------|
| ID連番     | user_id      | int     | not_null,uniq          |
| 質問タイトル   | title        | string | not_null               | 
| 質問詳細     | detail       | text   |                        | 
| 質問のステータス | status       | enum   | 0:未解決,1:解決済み　defalut:0 | 


answers

| 属性の意味            | カラム名     | 型     | その他(null、ユニーク、デフォルト値) | 
| --------------------- | ------------ | ------ | ------------------------------------ | 
| ID連番                | answer_id    | int    | not_null,uniq                        | 
| usersとの紐付けFK     | user_id      | int    | not_null                             | 
| questionsとの紐付けFK | questions_id | int    | not_null                             | 
| 答えタイトル          | title        | string | not_null                             | 
| 答え詳細              | detail       | text   |                                      | 
