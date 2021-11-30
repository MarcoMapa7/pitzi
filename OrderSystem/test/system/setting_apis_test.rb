require "application_system_test_case"

class SettingApisTest < ApplicationSystemTestCase
  setup do
    @setting_api = setting_apis(:one)
  end

  test "visiting the index" do
    visit setting_apis_url
    assert_selector "h1", text: "Setting Apis"
  end

  test "creating a Setting api" do
    visit setting_apis_url
    click_on "New Setting Api"

    fill_in "Email access", with: @setting_api.email_access
    fill_in "Token access", with: @setting_api.token_access
    click_on "Create Setting api"

    assert_text "Setting api was successfully created"
    click_on "Back"
  end

  test "updating a Setting api" do
    visit setting_apis_url
    click_on "Edit", match: :first

    fill_in "Email access", with: @setting_api.email_access
    fill_in "Token access", with: @setting_api.token_access
    click_on "Update Setting api"

    assert_text "Setting api was successfully updated"
    click_on "Back"
  end

  test "destroying a Setting api" do
    visit setting_apis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Setting api was successfully destroyed"
  end
end
