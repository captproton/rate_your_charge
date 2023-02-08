json.extract! location_review, :id, :author_name, :author_url, :profile_url, :rating, :text, :time, :type, :location_id, :created_at, :updated_at
json.url location_review_url(location_review, format: :json)
