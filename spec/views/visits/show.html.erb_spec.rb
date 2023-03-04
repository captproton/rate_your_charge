require 'rails_helper'

RSpec.describe "visits/show", type: :view do
  before(:each) do
    assign(:visit, Visit.create!(
      user: nil,
      location: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
