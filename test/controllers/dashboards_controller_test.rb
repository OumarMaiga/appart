require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboards_index_url
    assert_response :success
  end

  test "should get locations" do
    get dashboards_locations_url
    assert_response :success
  end

  test "should get types" do
    get dashboards_types_url
    assert_response :success
  end

  test "should get caracteristiques" do
    get dashboards_caracteristiques_url
    assert_response :success
  end

  test "should get utilisateurs" do
    get dashboards_utilisateurs_url
    assert_response :success
  end

  test "should get reservations" do
    get dashboards_reservations_url
    assert_response :success
  end

end
