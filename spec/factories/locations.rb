FactoryBot.define do
  factory :location do
    id { 1 }
    street_number { "MyString" }
    street { "MyString" }
    postal_code { "MyString" }
    city { "MyString" }
    country { "MyString" }
    formatted_address { "MyString" }
    formatted_phone_number { "MyString" }
    international_phone_number { "MyString" }
    lat { 1.5 }
    lng { 1.5 }
    name { "MyString" }
    permanently_closed { "MyString" }
    photos { "MyString" }
    place_id { "MyString" }
    rating { 1.5 }
    types { "MyString" }
    region { "MyString" }
    google_url { "MyString" }
    vicinity { "MyString" }
    website { "MyString" }
    created_at { "2023-02-07 11:05:20" }
    updated_at { "2023-02-07 11:05:20" }
    online_source { "MyString" }
  end
end
