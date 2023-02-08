FactoryBot.define do
  factory :notification do
    id { 1 }
    recipient_type { "MyString" }
    recipient_id { 1 }
    type { "" }
    params { "" }
    read_at { "2023-02-07 11:05:15" }
    created_at { "2023-02-07 11:05:15" }
    updated_at { "2023-02-07 11:05:15" }
  end
end
