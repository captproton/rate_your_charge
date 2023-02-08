class CityState < ApplicationRecord
    def self.list_cities_in_a_state(state_abbr:, country_abbr: "us")
        # state_abbr ex: CA for California
        puts "the class for state_abbr is #{state_abbr.class} "

        puts state_abbr
        puts "the class for country_abbr is #{country_abbr.class} "
        list = CS.cities(state_abbr, country_abbr)
    end
end
