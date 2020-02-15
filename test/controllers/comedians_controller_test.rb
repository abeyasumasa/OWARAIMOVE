require 'test_helper'

class ComediansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comedians_index_url
    assert_response :success
  end

  test "should get show" do
    get comedians_show_url
    assert_response :success
  end

  test "should get edit" do
    get comedians_edit_url
    assert_response :success
  end

  test "should get update" do
    get comedians_update_url
    assert_response :success
  end

  test "should get destroy" do
    get comedians_destroy_url
    assert_response :success
  end

end
