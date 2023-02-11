require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        address_line1: "Address Line1",
        address_line2: "Address Line2",
        city: "City",
        state: "State",
        postal_code: "Postal Code",
        country: "Country",
        lat: "9.99",
        lng: "9.99"
      ),
      Listing.create!(
        address_line1: "Address Line1",
        address_line2: "Address Line2",
        city: "City",
        state: "State",
        postal_code: "Postal Code",
        country: "Country",
        lat: "9.99",
        lng: "9.99"
      )
    ])
  end

  it "renders a list of listings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Address Line1".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address Line2".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Postal Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
