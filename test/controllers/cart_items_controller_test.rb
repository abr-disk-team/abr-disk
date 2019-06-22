require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_items_index_url
    assert_response :success
  end

  test "should get show" do
    get cart_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get cart_items_edit_url
    assert_response :success
  end

  test "should get index" do
    get cart_items_index_url
    assert_response :success
  end

end
