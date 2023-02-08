FactoryBot.define do
  factory :location_review do
    id { 1 }
    author_name { "MyString" }
    author_url { "MyString" }
    profile_url { "MyString" }
    rating { 1 }
    text { "MyString" }
    time { 1 }
    type { "" }
    online_source { "MyString" }
    location_id { 1 }
    created_at { "2023-02-07 11:05:18" }
    updated_at { "2023-02-07 11:05:18" }
  end
end
