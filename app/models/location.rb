class Location < ApplicationRecord
    require 'google_places'
    # https://github.com/qpowell/google_places/blob/master/spec/google_places/spot_spec.rb
    def self.import_spot(spot_id)
        import_with_google_places(spot_id)
    end

    def self.import_with_google_places(spot_id)
        @client = GooglePlaces::Client.new(self.api_key)
        @spot = @client.spot(spot_id.to_s)
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


    def self.get_all_ev_charing_places(lat: '40.808235', lng: '-73.948733', radius: 500, multipage: false)

        @collection = GooglePlaces::Spot.list_by_query('Electric Vehicle Charging', api_key, :lat => lat, lng: lng, radius: radius, :multipage => multipage)
    end    

    def self.get_ev_charging_places_in_or_near_a_city(city: " Mountain View CA", radius: 20)
        spots = google_places_client.spots_by_query("EV charging places near #{city}", radius: radius )        
    end    

    private
        def self.api_key
            Rails.application.credentials.dig(:google_places, :api_key)
        end

        def self.google_places_client
            GooglePlaces::Client.new(self.api_key)
        end
    
end
