require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get _nav" do
    get pages__nav_url
    assert_response :success
  end

  test "should get users" do
    get pages_users_url
    assert_response :success
  end

end
