FactoryBot.define do
  factory :announcement do
    id { 1 }
    published_at { "2023-02-07 11:05:23" }
    announcement_type { "MyString" }
    name { "MyString" }
    description { "MyText" }
    created_at { "2023-02-07 11:05:23" }
    updated_at { "2023-02-07 11:05:23" }
  end
end
