FactoryBot.define do
  factory :user do
    id { 1 }
    email { "MyString" }
    encrypted_password { "MyString" }
    reset_password_token { "MyString" }
    reset_password_sent_at { "2023-02-07 11:05:26" }
    remember_created_at { "2023-02-07 11:05:26" }
    first_name { "MyString" }
    last_name { "MyString" }
    announcements_last_read_at { "2023-02-07 11:05:26" }
    admin { false }
    created_at { "2023-02-07 11:05:26" }
    updated_at { "2023-02-07 11:05:26" }
  end
end
