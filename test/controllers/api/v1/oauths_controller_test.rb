require "test_helper"

class Api::V1::OauthsControllerTest < ActionDispatch::IntegrationTest
  test "should get oauth" do
    get api_v1_oauths_oauth_url
    assert_response :success
  end

  test "should get callback" do
    get api_v1_oauths_callback_url
    assert_response :success
  end
end
