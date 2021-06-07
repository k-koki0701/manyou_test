FactoryBot.define do
  factory :user do
    name { "user" }
    sequence(:email) { "user@example.com" }
    password { "user_password" }
    admin { 'false' }
  end
  factory :second_user, class: User do
    name { "admin_user" }
    sequence(:email) { "admin@example.com" }
    password { "admin_password" }
    admin { 'true' }
  end
end
