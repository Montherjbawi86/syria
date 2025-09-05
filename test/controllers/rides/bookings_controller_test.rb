require "test_helper"

class Rides::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rides_bookings_index_url
    assert_response :success
  end

  test "should get show" do
    get rides_bookings_show_url
    assert_response :success
  end

  test "should get new" do
    get rides_bookings_new_url
    assert_response :success
  end
end
