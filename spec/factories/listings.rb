FactoryBot.define do
  factory :listing do
    address_line1 { "MyString" }
    address_line2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    postal_code { "MyString" }
    country { "MyString" }
    lat { "9.99" }
    lng { "9.99" }
  end
end
