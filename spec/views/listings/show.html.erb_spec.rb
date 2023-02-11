require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    assign(:listing, Listing.create!(
      address_line1: "Address Line1",
      address_line2: "Address Line2",
      city: "City",
      state: "State",
      postal_code: "Postal Code",
      country: "Country",
      lat: "9.99",
      lng: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address Line1/)
    expect(rendered).to match(/Address Line2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
