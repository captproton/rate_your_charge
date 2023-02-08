FactoryBot.define do
  factory :city_state do
    # city { "MyString" }
    state { FFaker::AddressUS.state_abbr }
  end
end
