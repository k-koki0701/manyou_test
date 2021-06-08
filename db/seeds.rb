User.create!(
   name: 'テスト太郎0',
   email: 'test@test.com',
   password: 'password',
   password_confirmation: 'password'
)

User.create!(
   name:  "管理者",
   email: "admin@example.jp",
   password:  "kokoko",
   password_confirmation: "kokoko",
   admin: true
   )

['会議', '打ち合わせ', '商談', '作成', '修正', '短期', '長期', '中期', '緊急','その他'].each { |n|
  Label.create(name: n)
}

10.times do |n|
   User.create!(
     email: "test#{n + 1}@test.com",
     name: "テスト太郎#{n + 1}",
     password: 'password',
     password_confirmation: 'password'
   )
 end

 10.times do |n|
   User.all.each do |user|
   task_name = "エラー"
   task_detail = "エラー修正"
   user.tasks.create!(task_name: task_name, task_detail: task_detail)
   end
 end
