require 'rails_helper'

RSpec.describe CityState, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # subject = CityState.list_cities_in_a_state()
  it 'returns a list of cities of the chosen city' do
    state_abbr = "CA"
    subject = CityState.list_cities_in_a_state(state_abbr: "CA")
    expect(subject).to eq("something")
  end
  
end
