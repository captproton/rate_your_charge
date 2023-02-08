FactoryBot.define do
  factory :service do
    id { 1 }
    user_id { 1 }
    provider { "MyString" }
    uid { "MyString" }
    access_token { "MyString" }
    access_token_secret { "MyString" }
    refresh_token { "MyString" }
    expires_at { "2023-02-07 11:05:09" }
    auth { "MyText" }
    created_at { "2023-02-07 11:05:09" }
    updated_at { "2023-02-07 11:05:09" }
  end
end
