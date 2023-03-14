require 'rails_helper'

RSpec.describe "visits/new", type: :view do
  before(:each) do
    assign(:visit, Visit.new(
      comment: "MyText",
      user_id: 1,
      location_id: 1
    ))
  end

  it "renders new visit form" do
    render

    assert_select "form[action=?][method=?]", visits_path, "post" do

      assert_select "textarea[name=?]", "visit[comment]"

      assert_select "input[name=?]", "visit[user_id]"

      assert_select "input[name=?]", "visit[location_id]"
    end
  end
end
