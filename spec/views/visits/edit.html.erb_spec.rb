require 'rails_helper'

RSpec.describe "visits/edit", type: :view do
  let(:visit) {
    Visit.create!(
      user: nil,
      location: nil
    )
  }

  before(:each) do
    assign(:visit, visit)
  end

  it "renders the edit visit form" do
    render

    assert_select "form[action=?][method=?]", visit_path(visit), "post" do

      assert_select "input[name=?]", "visit[user_id]"

      assert_select "input[name=?]", "visit[location_id]"
    end
  end
end
