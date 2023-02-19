class Location < ApplicationRecord
    # validates :name, :formatted_address, :lat, :lng, presence: true
    # validates :formatted_address, uniqueness: true
    # validates :lat, uniqueness: {scope: :lng}

    has_many :location_reviews
    has_one  :nrel_location

    def self.collect_all_location_of_us_by_state(country_abbr: "US")
        # CS chokes occasionally.  Just try again.
        state_symbols = [
          :AK, :AL, :AR, :AZ, :CA, :CO, :CT, :DC, :DE, :FL,
          :GA, :HI, :IA, :ID, :IL, :IN, :KS, :KY, :LA, :MA,
          :MD, :ME, :MI, :MN, :MO, :MS, :MT, :NC, :ND, :NE,
          :NH, :NJ, :NM, :NV, :NY, :OH, :OK, :OR, :PA, :RI,
          :SC, :SD, :TN, :TX, :UT, :VA, :VT, :WA, :WI, :WV,
          :WY] 
        states = state_symbols.map {|x| x.to_s}
  
        states.each do |state|
          puts "################################"
          puts  "starting #{state}"
          puts "################################"
          sleep 0.5
          self.update_all_locations_in_state(state)
        end
      end
  
  
    def self.update_all_locations_in_state(state_code)
        all_locations = NrelLocation.where(state: state_code)
        all_zipcodes = all_locations.map { |location| location[:zip] }.uniq
      
        all_zipcodes.each do |zipcode|
            # Check if there are any existing locations for the zipcode in the given state
            #   existing_locations = Location.where(state: state_code, zip: zipcode)
            # fetch data from NrelLocation model
            nrel_locations = NrelLocation.where(zip: zipcode).map do |nrel_location|
                {
                name: nrel_location.name,
                formatted_address: nrel_location.formatted_address,
                latitude: nrel_location.latitude,
                longitude: nrel_location.longitude,
                state: nrel_location.state,
                city: nrel_location.city,
                zip: nrel_location.zip,
                ev_level1_evse_num: nrel_location.ev_level1_evse_num,
                ev_level2_evse_num: nrel_location.ev_level2_evse_num,
                ev_dc_fast_num: nrel_location.ev_dc_fast_num,
                ev_network: nrel_location.ev_network,
                ev_network_web: nrel_location.ev_network_web,
                phone: nrel_location.phone,
                distance: nrel_location.distance,
                hours: nrel_location.hours,
                owner_type_code: nrel_location.owner_type_code,
                fuel_type_code: nrel_location.fuel_type_code,
                id: nrel_location.api_id,
                updated_at: nrel_location.updated_at,
                source: 'NREL'
                }
            end

            nrel_locations.each do |station|
            #     # find or initialize a Location record with the given uniquey formatted address
                station = OpenStruct.new(station)
                location = Location.find_or_initialize_by(formatted_address: station.formatted_address)
                
            #     # update the fields on the NrelLocation record with the data from the API
                loc_name = station.name|| "#{station.ev_network} EV Charging Station"
                location.update!(
                    name: loc_name,
                    formatted_address: station.formatted_address,
                    lat: station.latitude,
                    lng: station.longitude,
                    state: station.state,
                    city: station.city,
                    postal_code: station.zip,
                    level_one_charger_count: station.ev_level1_evse_num,
                    level_two_charger_count: station.ev_level2_evse_num,
                    dc_fast_charger_count: station.ev_dc_fast_num,
                    ev_network: station.ev_network,
                    formatted_phone_number: station.phone,
                    online_source: station.source,
                    website: station.ev_network_web,
                    hours: station.hours,
                    owner_type_code: station.owner_type_code,
                    updated_at: station.updated_at
                  )
            end
        end
            

            # fetch data from other sources and merge with NrelLocation data
            # other_locations = # fetch data from other sources and transform to the same format as nrel_locations

            # merge the two lists and return the combined list
            # all_locations = nrel_locations # + other_locations

    end
    
end
