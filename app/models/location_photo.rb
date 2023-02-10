class LocationPhoto < ApplicationRecord
  belongs_to :location
  # FIX: validates presence
  # validates :fetched_url, :photo_reference, :lat, :lng, presence: true
  validates :fetched_url, uniqueness: true

  def self.get_set_of_google_places_photos(place_id:, max_width: 400, places_api_key:)
    spot = GooglePlaces::Spot.find(place_id, places_api_key)
    full_photos = []
    spot.photos.each do |photo|
      photo_reference = photo.photo_reference
      place_photo = GooglePlaces::Photo.new(400, 400, photo_reference, [], places_api_key)
      url = place_photo.fetch_url(max_width)  
      full_photos << place_photo
    end
    full_photos
  end

  def self.save_set_of_google_places_photos(location_id:, place_id:, max_width: 400, places_api_key:)
    photo_set = get_set_of_google_places_photos(place_id: place_id, max_width: max_width, places_api_key: places_api_key)
    photo_set.each do |place_photo|
      # use GooglePlaces object, see spec in gem
      url = place_photo.fetch_url(max_width)
      self.where(photo_reference: place_photo.photo_reference.to_s).first_or_create do |place_photo|
        fetched_url         = url.to_s, 
        height              = place_photo.height.to_i, 
        html_attributions   = place_photo.html_attributions.to_s, 
        photo_reference     = place_photo.photo_reference.to_s, 
        location_id         = location_id
      end
    end
  end
end
