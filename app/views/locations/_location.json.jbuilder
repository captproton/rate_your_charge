json.extract! location, :id, :street_number,, :street,, :postal_code,, :city,, :country,, :formatted_address,, :formatted_phone_number,, :international_phone_number,, :lat,, :lng,, :name,, :permanently_closed,, :photos,, :place_id,, :rating,, :types,, :region,, :reviews,, :google_url,, :vicinity,, :website, :created_at, :updated_at
json.url location_url(location, format: :json)
