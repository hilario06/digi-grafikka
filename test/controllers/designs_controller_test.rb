require "test_helper"

class DesignsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get designs_index_url
    assert_response :success
  end

  test "should get new" do
    get designs_new_url
    assert_response :success
  end

  test "should get create" do
    get designs_create_url
    assert_response :success
  end

  test "should get show" do
    get designs_show_url
    assert_response :success
  end

  test "should get update" do
    get designs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get designs_destroy_url
    assert_response :success
  end
end
