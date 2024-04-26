require "test_helper"

class EventControllerTest < ActionDispatch::IntegrationTest
  test "should get attendance" do
    get event_attendance_url
    assert_response :success
  end
end
