require 'rails_helper'

RSpec.describe "visits/edit", type: :view do
  let(:visit) {
    Visit.create!(
      comment: "MyText",
      user_id: 1,
      location_id: 1
    )
  }

  before(:each) do
    assign(:visit, visit)
  end

  it "renders the edit visit form" do
    render

    assert_select "form[action=?][method=?]", visit_path(visit), "post" do

      assert_select "textarea[name=?]", "visit[comment]"

      assert_select "input[name=?]", "visit[user_id]"

      assert_select "input[name=?]", "visit[location_id]"
    end
  end
end
