class Location < ApplicationRecord
    require 'google_places'
    validates :name, :formatted_address, :lat, :lng, presence: true
    # validates :formatted_address, uniqueness: true
    validates :lat, uniqueness: {scope: :lng}
    # https://github.com/qpowell/google_places/blob/master/spec/google_places/spot_spec.rb
    def self.import_spot(spot_id)
        import_with_google_places(spot_id)
    end

    def self.import_with_google_places(spot_id)
        @spot = google_places_client.spot(spot_id.to_s)
        Location.create!(street_number:@spot.street_number,
            postal_code:                @spot.postal_code,
            city:                       @spot.city,
            country:                    @spot.country,
            formatted_address:          @spot.formatted_address,
            formatted_phone_number:     @spot.formatted_phone_number,
            international_phone_number: @spot.international_phone_number,
            lat:                        @spot.lat,
            lng:                        @spot.lng,
            name:                       @spot.name,
            permanently_closed:         @spot.permanently_closed,
            place_id:                   @spot.place_id,
            rating:                     @spot.rating,
            types:                      @spot.types,
            region:                     @spot.region,
            google_url:                 @spot.url,
            vicinity:                   @spot.vicinity,
            website:                    @spot.website

        )
    end

    def self.save_list_of_ev_charging_places(city:, radius: 500, multipage: false)
        collection = get_all_ev_charing_places(city: city, radius: radius, multipage: multipage)

        collection.each do |spot|
            loc_formatted_address_array =   spot.formatted_address.split(", ")
            street_number               =   spot.street_number.presence || loc_formatted_address_array[0].presence || ""
            city                        =   spot.city.presence || loc_formatted_address_array.last(3).first.presence || ""
            # state                       =   spot.state.presence || loc_formatted_address_array[2].split(" ")[0].presence || ""
            postal_code                 =   spot.postal_code.presence || loc_formatted_address_array.last(2).first.split(/\s/).last.presence || ""

            loc = Location.where(place_id: spot.place_id).first_or_create(street_number: street_number,
            postal_code:                    postal_code,
            city:                           city,
            country:                        spot.country,
            formatted_address:              spot.formatted_address,
            formatted_phone_number:         spot.formatted_phone_number,
            international_phone_number:     spot.international_phone_number,
            lat:                            spot.lat,
            lng:                            spot.lng,
            name:                           spot.name,
            permanently_closed:             spot.permanently_closed,
            place_id:                       spot.place_id,
            rating:                         spot.rating,
            types:                          spot.types,
            region:                         spot.region,
            google_url:                     spot.url,
            vicinity:                       spot.vicinity,
            website:                        spot.website,
            online_source:                  "google places"
            )

            loc.update(street_number:       street_number,
            postal_code:                    postal_code,
            city:                           city,
            country:                        spot.country,
            formatted_address:              spot.formatted_address,
            formatted_phone_number:         spot.formatted_phone_number,
            international_phone_number:     spot.international_phone_number,
            lat:                            spot.lat,
            lng:                            spot.lng,
            name:                           spot.name,
            permanently_closed:             spot.permanently_closed,
            place_id:                       spot.place_id,
            rating:                         spot.rating,
            types:                          spot.types,
            region:                         spot.region,
            google_url:                     spot.url,
            vicinity:                       spot.vicinity,
            website:                        spot.website,
            online_source:                  "google places")
        end
    end

    def self.get_all_ev_charing_places(city:, radius: 500, multipage: false)
        first_spot_in_the_list = get_ev_charging_places_in_or_near_a_city(city: city, radius: 5).first
        lat = first_spot_in_the_list.lat
        lng = first_spot_in_the_list.lng
        collection = GooglePlaces::Spot.list_by_query('Electric vehicle charging station', api_key, :lat => lat, lng: lng, radius: radius, :multipage => multipage)

    end    

    def self.get_ev_charging_places_in_or_near_a_city(city:, radius: 20)
        spots = google_places_client.spots_by_query("EV charging places near #{city}", radius: radius )        
    end

    def self.import_all_google_places_from_a_state(state_abbr:, country_abbr: "US")
        cities = CityState.list_cities_in_a_state(state_abbr: state_abbr, country_abbr: country_abbr)

        cities.each do |city|
            save_list_of_ev_charging_places(city: city, radius: 500, multipage: false)
            puts "################################"
            puts "saved #{city}"
            sleep 0.5
        end
    end

    private
        def self.api_key
            Rails.application.credentials.dig(:google_places, :api_key)
        end

        def self.google_places_client
            GooglePlaces::Client.new(self.api_key)
        end
    
end
