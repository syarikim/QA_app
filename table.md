users

| 属性の意味     | カラム名     | 型      | その他(null、ユニーク、デフォルト値) |
| -------------- | ------------ | ------- | ------------------------------------ |
| 名前           | name    | string  | not_null                             |
| メールアドレス | email         | string    | uniq                                 |
| アバター画像 | avataara_img         | string    |                                  |
| 管理者かどうか | admin     | boolean | not_null,defalut:false                        | 
| パスワード | password_digest     | string | not_null                        | 



questions

| 属性の意味    | カラム名     | 型      | その他(null、ユニーク、デフォルト値)  |
|----------| ------------ | ------- |------------------------|
| usersとの紐付けFK     | user_id      | int    | not_null                             | 
| 質問タイトル   | title        | string | not_null               | 
| 質問詳細     | detail       | text   |                        | 
| 質問のステータス | status       | int   | 0:未解決,1:解決済み　defalut:0 | 


answers

| 属性の意味            | カラム名     | 型     | その他(null、ユニーク、デフォルト値) | 
| --------------------- | ------------ | ------ | ------------------------------------ | 
| usersとの紐付けFK     | user_id      | int    | not_null                             | 
| questionsとの紐付けFK | question_id | int    | not_null                             | 
| 答えタイトル          | title        | string | not_null                             | 
| 答え詳細              | detail       | text   |                                      | 
