require 'rails_helper'

RSpec.describe Location, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # describe a method that grabs a locations from GooglePlaces
  
  # describe a method that grabs a list of locations from GooglePlaces

  # describe a method that saves the details of each location to Google

  # describe a method that saves the reviews of each location

  describe "get_ev_charging_places_in_or_near_a_city" do
      @subject = Location.get_ev_charging_places_in_or_near_a_city(city: "Anaheim CA", radius: 20)
    it 'returns a list of locations at or near a city' do
      subject = @subject
      expect(subject.class).to eq(Array)
      expect(subject.length).to be > 3
    end

    it 'returns a google place that describes an EV charger' do
      subject = @subject      
      expect(@subject.first).to eq "something"      
    end

    it 'returns a GooglePlaces::Spot' do
      subject = @subject
      expect(@subject.first.class).to eq GooglePlaces::Spot            
    end
    
    
  end
  
  
end
