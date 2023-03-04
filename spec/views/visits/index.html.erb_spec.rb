require 'rails_helper'

RSpec.describe "visits/index", type: :view do
  before(:each) do
    assign(:visits, [
      Visit.create!(
        user: nil,
        location: nil
      ),
      Visit.create!(
        user: nil,
        location: nil
      )
    ])
  end

  it "renders a list of visits" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
