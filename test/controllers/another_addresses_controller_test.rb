require 'test_helper'

class AnotherAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get another_addresses_create_url
    assert_response :success
  end

  test "should get edit" do
    get another_addresses_edit_url
    assert_response :success
  end

  test "should get update" do
    get another_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get another_addresses_destroy_url
    assert_response :success
  end

end
