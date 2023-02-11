require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  let(:listing) {
    Listing.create!(
      address_line1: "MyString",
      address_line2: "MyString",
      city: "MyString",
      state: "MyString",
      postal_code: "MyString",
      country: "MyString",
      lat: "9.99",
      lng: "9.99"
    )
  }

  before(:each) do
    assign(:listing, listing)
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(listing), "post" do

      assert_select "input[name=?]", "listing[address_line1]"

      assert_select "input[name=?]", "listing[address_line2]"

      assert_select "input[name=?]", "listing[city]"

      assert_select "input[name=?]", "listing[state]"

      assert_select "input[name=?]", "listing[postal_code]"

      assert_select "input[name=?]", "listing[country]"

      assert_select "input[name=?]", "listing[lat]"

      assert_select "input[name=?]", "listing[lng]"
    end
  end
end
