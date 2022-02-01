require "test_helper"

class FollowersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get followers_index_url
    assert_response :success
  end

  test "should get new" do
    get followers_new_url
    assert_response :success
  end

  test "should get create" do
    get followers_create_url
    assert_response :success
  end

  test "should get show" do
    get followers_show_url
    assert_response :success
  end

  test "should get update" do
    get followers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get followers_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get followers_edit_url
    assert_response :success
  end
end
