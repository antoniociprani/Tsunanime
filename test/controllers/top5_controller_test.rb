require "test_helper"

class Top5ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top5_index_url
    assert_response :success
  end
end
