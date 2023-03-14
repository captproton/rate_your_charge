require 'rails_helper'

RSpec.describe "visits/show", type: :view do
  before(:each) do
    assign(:visit, Visit.create!(
      comment: "MyText",
      user_id: 2,
      location_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
