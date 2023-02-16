require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:google_places_client) { instance_double("GooglePlaces::Client") }

  before do
    allow(GooglePlaces::Client).to receive(:new).and_return(google_places_client)
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:formatted_address) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }

    it { should validate_uniqueness_of(:lat).scoped_to(:lng) }
  end

  describe "associations" do
    it { should have_many(:location_reviews) }
  end

  describe ".import_with_google_places" do
    let(:spot) { instance_double("GooglePlaces::Spot") }
    let(:location) { instance_double("Location") }

    before do
      allow(google_places_client).to receive(:spot).and_return(spot)
      allow(Location).to receive(:create!).and_return(location)
    end

    it "creates a location from a GooglePlaces::Spot" do
      expect(Location).to receive(:create!).with({
        street_number: spot.street_number,
        postal_code: spot.postal_code,
        city: spot.city,
        country: spot.country,
        formatted_address: spot.formatted_address,
        formatted_phone_number: spot.formatted_phone_number,
        international_phone_number: spot.international_phone_number,
        lat: spot.lat,
        lng: spot.lng,
        name: spot.name,
        permanently_closed: spot.permanently_closed,
        place_id: spot.place_id,
        rating: spot.rating,
        types: spot.types,
        region: spot.region,
        google_url: spot.url,
        vicinity: spot.vicinity,
        website: spot.website
      })

      Location.import_with_google_places("spot_id")
    end
  end

    describe ".save_list_of_ev_charging_places" do
      it "saves a list of EV charging places from Google Places" do
        # Prepare test data
        city = "San Francisco"
        radius = 500
        multipage = false
        spot = double("spot",
                      formatted_address: "123 Main St, San Francisco, CA 94105, USA",
                      street_number: "123",
                      postal_code: "94105",
                      city: "San Francisco",
                      country: "USA",
                      formatted_phone_number: "+1 415-123-4567",
                      international_phone_number: "+1 415-123-4567",
                      lat: 37.7867767,
                      lng: -122.4054458,
                      name: "Test EV Charging Station",
                      permanently_closed: false,
                      place_id: "1234",
                      rating: 4.5,
                      types: ["point_of_interest", "establishment"],
                      region: nil,
                      url: "https://maps.google.com/?cid=1234",
                      vicinity: "123 Main St, San Francisco",
                      website: "https://example.com/")
  
        allow(GooglePlaces::Spot).to receive(:list_by_query).and_return([spot])
        allow(GooglePlaces::Spot).to receive(:find).and_return(spot)
  
        # Run the method being tested
        Location.save_list_of_ev_charging_places(city: city, radius: radius, multipage: multipage)
  
        # Check that the data was saved correctly
        location = Location.last
        expect(location.street_number).to eq("123")
        expect(location.postal_code).to eq("94105")
        expect(location.city).to eq("San Francisco")
        expect(location.country).to eq("USA")
        expect(location.formatted_address).to eq("123 Main St, San Francisco, CA 94105, USA")
        expect(location.formatted_phone_number).to eq("+1 415-123-4567")
        expect(location.international_phone_number).to eq("+1 415-123-4567")
        expect(location.lat).to eq(37.7867767)
        expect(location.lng).to eq(-122.4054458)
        expect(location.name).to eq("Test EV Charging Station")
        expect(location.permanently_closed).to be_falsey
        expect(location.place_id).to eq("1234")
        expect(location.rating).to eq(4.5)
        expect(location.types).to eq(["point_of_interest", "establishment"])
        expect(location.region).to be_nil
        expect(location.google_url).to eq("https://maps.google.com/?cid=1234")
        expect(location.vicinity).to eq("123 Main St, San Francisco")
        expect(location.website).to eq("https://example.com/")
        expect(location.online_source).to eq("google places")
      end
    end
end

  # # Orginal Spec

# require 'rails_helper'

# RSpec.describe Location, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"

#   # describe a method that grabs a locations from GooglePlaces
  
#   # describe a method that grabs a list of locations from GooglePlaces

#   # describe a method that saves the details of each location to Google

#   # describe a method that saves the reviews of each location

#   describe "get_ev_charging_places_in_or_near_a_city" do
#       @subject = Location.get_ev_charging_places_in_or_near_a_city(city: "Anaheim CA", radius: 20)
#     it 'returns a list of locations at or near a city' do
#       subject = @subject
#       expect(subject.class).to eq(Array)
#       expect(subject.length).to be > 3
#     end

#     it 'returns a google place that describes an EV charger' do
#       subject = @subject      
#       expect(@subject.first).to eq "something"      
#     end

#     it 'returns a GooglePlaces::Spot' do
#       subject = @subject
#       expect(@subject.first.class).to eq GooglePlaces::Spot            
#     end
    
    
#   end
  
  
# end
