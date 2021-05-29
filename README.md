# Readme

| Users |
| ---- |
| name:string |  
| email:string |
| password:string |

| Tasks |
| ---- |
| task_name:string |  
| task_detail:text |
| end_period:string |
| status:string |  
| priority:string |

| Labels |
| ---- |
| label_name:string |

## Herokuにデプロイ

**ログイン**
コマンドラインからHerokuにログインします。  
$ heroku login  
  
**Herokuアプリを作成**  
heroku create {アプリ名}でHerokuアプリを作成します  
  
**デプロイ**
$ git push heroku master  
  
**本番環境(Heroku)でマイグレーション**
デプロイをしたマイグレーションファイルを元に、本番環境用のデータベースを作成します。  
$ heroku run rails db:migrate  
  
これで全てのデプロイ作業が完了です。  
  
gem version 3.0.3
