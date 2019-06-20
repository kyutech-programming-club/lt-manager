require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get events_top_url
    assert_response :success
  end

end
