require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get createroom_path
    assert_response :success
  end

end
