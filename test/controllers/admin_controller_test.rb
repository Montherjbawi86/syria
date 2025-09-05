require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get users" do
    get admin_users_url
    assert_response :success
  end

  test "should get rides" do
    get admin_rides_url
    assert_response :success
  end

  test "should get bookings" do
    get admin_bookings_url
    assert_response :success
  end
end
