require "test_helper"

class SettingApisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting_api = setting_apis(:one)
  end

  test "should get index" do
    get setting_apis_url
    assert_response :success
  end

  test "should get new" do
    get new_setting_api_url
    assert_response :success
  end

  test "should create setting_api" do
    assert_difference('SettingApi.count') do
      post setting_apis_url, params: { setting_api: { email_access: @setting_api.email_access, token_access: @setting_api.token_access } }
    end

    assert_redirected_to setting_api_url(SettingApi.last)
  end

  test "should show setting_api" do
    get setting_api_url(@setting_api)
    assert_response :success
  end

  test "should get edit" do
    get edit_setting_api_url(@setting_api)
    assert_response :success
  end

  test "should update setting_api" do
    patch setting_api_url(@setting_api), params: { setting_api: { email_access: @setting_api.email_access, token_access: @setting_api.token_access } }
    assert_redirected_to setting_api_url(@setting_api)
  end

  test "should destroy setting_api" do
    assert_difference('SettingApi.count', -1) do
      delete setting_api_url(@setting_api)
    end

    assert_redirected_to setting_apis_url
  end
end
