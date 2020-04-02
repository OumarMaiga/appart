require 'test_helper'

class CaracteristiquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caracteristique = caracteristiques(:one)
  end

  test "should get index" do
    get caracteristiques_url
    assert_response :success
  end

  test "should get new" do
    get new_caracteristique_url
    assert_response :success
  end

  test "should create caracteristique" do
    assert_difference('Caracteristique.count') do
      post caracteristiques_url, params: { caracteristique: { icon: @caracteristique.icon, libelle: @caracteristique.libelle } }
    end

    assert_redirected_to caracteristique_url(Caracteristique.last)
  end

  test "should show caracteristique" do
    get caracteristique_url(@caracteristique)
    assert_response :success
  end

  test "should get edit" do
    get edit_caracteristique_url(@caracteristique)
    assert_response :success
  end

  test "should update caracteristique" do
    patch caracteristique_url(@caracteristique), params: { caracteristique: { icon: @caracteristique.icon, libelle: @caracteristique.libelle } }
    assert_redirected_to caracteristique_url(@caracteristique)
  end

  test "should destroy caracteristique" do
    assert_difference('Caracteristique.count', -1) do
      delete caracteristique_url(@caracteristique)
    end

    assert_redirected_to caracteristiques_url
  end
end
