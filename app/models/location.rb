class Location < ApplicationRecord
    require 'google_places'
    validates :name, :formatted_address, :lat, :lng, presence: true
    # validates :formatted_address, uniqueness: true
    validates :lat, uniqueness: {scope: :lng}

    has_many :location_reviews
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
            formatted_street_number     =   spot.street_number.presence || loc_formatted_address_array[0].presence || ""
            formatted_city              =   spot.city.presence || loc_formatted_address_array.last(3).first.presence || ""
            formatted_state             =   loc_formatted_address_array[2].split(" ")[0].presence || ""
            formatted_postal_code       =   spot.postal_code.presence || loc_formatted_address_array.last(2).first.split(/\s/).last.presence || ""

            loc = Location.where(place_id: spot.place_id).first_or_create(street_number: formatted_street_number,
            postal_code:                    formatted_postal_code,
            city:                           formatted_city,
            state:                          formatted_state,
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

            loc.update(street_number:       formatted_street_number,
            postal_code:                    formatted_postal_code,
            city:                           formatted_city,
            state:                          formatted_state,
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

            # add any available photos
            photo_set = LocationPhoto.get_set_of_google_places_photos(place_id: spot.place_id, max_width: 400, places_api_key: api_key)
            if Array(photo_set).length > 0
                photo_set = LocationPhoto.save_set_of_google_places_photos(location_id: loc.id, place_id: spot.place_id, max_width: 400, places_api_key: api_key)
                puts "********************************"
                puts "photo_set length: #{photo_set.length}"
                puts "********************************"
            end
                # [loc, photo_set]
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

            # log that the places in the city were updated in a summary
            current_city              = city.presence || "FIX: #{city}"
            current_state             = state_abbr.presence || "FIX: #{city}"
            current_country           = country_abbr.presence || "FIX: #{city}"

            city_state = CityState.where(city: current_city, state: current_state).first_or_create do |city|
                        city.country = current_country
            end
            city_state.touch

            puts "################################"
            puts "current_city: #{city}, #{state_abbr} #{current_country}"
            puts "saved #{current_city}, #{current_state}"
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
