require "application_system_test_case"

class LocationReviewsTest < ApplicationSystemTestCase
  setup do
    @location_review = location_reviews(:one)
  end

  test "visiting the index" do
    visit location_reviews_url
    assert_selector "h1", text: "Location reviews"
  end

  test "should create location review" do
    visit location_reviews_url
    click_on "New location review"

    fill_in "Author name", with: @location_review.author_name
    fill_in "Author url", with: @location_review.author_url
    fill_in "Location", with: @location_review.location_id
    fill_in "Profile url", with: @location_review.profile_url
    fill_in "Rating", with: @location_review.rating
    fill_in "Text", with: @location_review.text
    fill_in "Time", with: @location_review.time
    fill_in "Type", with: @location_review.type
    click_on "Create Location review"

    assert_text "Location review was successfully created"
    click_on "Back"
  end

  test "should update Location review" do
    visit location_review_url(@location_review)
    click_on "Edit this location review", match: :first

    fill_in "Author name", with: @location_review.author_name
    fill_in "Author url", with: @location_review.author_url
    fill_in "Location", with: @location_review.location_id
    fill_in "Profile url", with: @location_review.profile_url
    fill_in "Rating", with: @location_review.rating
    fill_in "Text", with: @location_review.text
    fill_in "Time", with: @location_review.time
    fill_in "Type", with: @location_review.type
    click_on "Update Location review"

    assert_text "Location review was successfully updated"
    click_on "Back"
  end

  test "should destroy Location review" do
    visit location_review_url(@location_review)
    click_on "Destroy this location review", match: :first

    assert_text "Location review was successfully destroyed"
  end
end
