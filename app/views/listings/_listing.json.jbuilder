json.extract! listing, :id, :address_line1, :address_line2, :city, :state, :postal_code, :country, :lat, :lng, :created_at, :updated_at
json.url listing_url(listing, format: :json)
