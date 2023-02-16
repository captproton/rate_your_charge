class NrelLocation < ApplicationRecord
    include HTTParty

    def self.collect_locations_in_a_city(city:,state:)
      url = "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{city}+#{state}&fuel_type=ELEC&api_key=#{api_key}"
      response = HTTParty.get(url)
      charging_stations_data = response["fuel_stations"]      
      puts "================"
      charging_stations_data 
      # response.first
      charging_stations_data.each do |data|
        loc = self.where(nrel_id: data["id"]).first_or_create do |data|
          nrel_id = data["id"],
          date_last_confirmed = data["date_last_confirmed"],
          expected_date = data["expected_date"],
          station_name = data["station_name"],
          station_phone = data["station_phone"],
          nrel_updated_at = data["updated_at"],
          street_address = data["street_address"],
          city = data["city"],
          state = data["state"],
          zip = data["zip"],
          intersection_directions = data["intersection_directions"],
          ev_connector_types = data["ev_connector_types"],
          latitude = data["latitude"],
          longitude = data["longitude"],
          distance = data["distance"],
          fuel_type_code = data["fuel_type_code"],
          ev_dc_fast_num = data["ev_dc_fast_num"],
          ev_level1_evse_num = data["ev_level1_evse_num"],
          ev_level2_evse_num = data["ev_level2_evse_num"],
          ev_network = data["ev_network"],
          ev_network_web = data["ev_network_web"],
          access_days_time = data["access_days_time"],
          ev_network_ids = data["ev_network_ids"]
      end

      loc.update(nrel_id: data["id"],
        date_last_confirmed: data["date_last_confirmed"],
        expected_date: data["expected_date"],
        station_name: data["station_name"],
        station_phone: data["station_phone"],
        nrel_updated_at: data["updated_at"],
        street_address: data["street_address"],
        city: data["city"],
        state: data["state"],
        zip: data["zip"],
        intersection_directions: data["intersection_directions"],
        ev_connector_types: data["ev_connector_types"],
        latitude: data["latitude"],
        longitude: data["longitude"],
        distance: data["distance"],
        fuel_type_code: data["fuel_type_code"],
        ev_dc_fast_num: data["ev_dc_fast_num"],
        ev_level1_evse_num: data["ev_level1_evse_num"],
        ev_level2_evse_num: data["ev_level2_evse_num"],
        ev_network: data["ev_network"],
        ev_network_web: data["ev_network_web"],
        access_days_time: data["access_days_time"],
        ev_network_ids: data["ev_network_ids"]
      )
    end
  end
    private
      def self.api_key
          Rails.application.credentials.dig(:nrel_developer_network, :api_key)
      end

end