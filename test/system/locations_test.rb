require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:one)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h1", text: "Locations"
  end

  test "should create location" do
    visit locations_url
    click_on "New location"

    fill_in "City,", with: @location.city,
    fill_in "Country,", with: @location.country,
    fill_in "Formatted address,", with: @location.formatted_address,
    fill_in "Formatted phone number,", with: @location.formatted_phone_number,
    fill_in "Google url,", with: @location.google_url,
    fill_in "International phone number,", with: @location.international_phone_number,
    fill_in "Lat,", with: @location.lat,
    fill_in "Lng,", with: @location.lng,
    fill_in "Name,", with: @location.name,
    fill_in "Permanently closed,", with: @location.permanently_closed,
    fill_in "Photos,", with: @location.photos,
    fill_in "Place id,", with: @location.place_id,
    fill_in "Postal code,", with: @location.postal_code,
    fill_in "Rating,", with: @location.rating,
    fill_in "Region,", with: @location.region,
    fill_in "Reviews,", with: @location.reviews,
    fill_in "Street,", with: @location.street,
    fill_in "Street number,", with: @location.street_number,
    fill_in "Types,", with: @location.types,
    fill_in "Vicinity,", with: @location.vicinity,
    fill_in "Website", with: @location.website
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "should update Location" do
    visit location_url(@location)
    click_on "Edit this location", match: :first

    fill_in "City,", with: @location.city,
    fill_in "Country,", with: @location.country,
    fill_in "Formatted address,", with: @location.formatted_address,
    fill_in "Formatted phone number,", with: @location.formatted_phone_number,
    fill_in "Google url,", with: @location.google_url,
    fill_in "International phone number,", with: @location.international_phone_number,
    fill_in "Lat,", with: @location.lat,
    fill_in "Lng,", with: @location.lng,
    fill_in "Name,", with: @location.name,
    fill_in "Permanently closed,", with: @location.permanently_closed,
    fill_in "Photos,", with: @location.photos,
    fill_in "Place id,", with: @location.place_id,
    fill_in "Postal code,", with: @location.postal_code,
    fill_in "Rating,", with: @location.rating,
    fill_in "Region,", with: @location.region,
    fill_in "Reviews,", with: @location.reviews,
    fill_in "Street,", with: @location.street,
    fill_in "Street number,", with: @location.street_number,
    fill_in "Types,", with: @location.types,
    fill_in "Vicinity,", with: @location.vicinity,
    fill_in "Website", with: @location.website
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "should destroy Location" do
    visit location_url(@location)
    click_on "Destroy this location", match: :first

    assert_text "Location was successfully destroyed"
  end
end
