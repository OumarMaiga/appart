require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:one)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h1", text: "Locations"
  end

  test "creating a Location" do
    visit locations_url
    click_on "New Location"

    fill_in "Adresse", with: @location.adresse
    fill_in "Description", with: @location.description
    check "Etat" if @location.etat
    fill_in "Nombre adulte", with: @location.nombre_adulte
    fill_in "Nombre chamber", with: @location.nombre_chamber
    fill_in "Nombre enfant", with: @location.nombre_enfant
    fill_in "Nombre salon", with: @location.nombre_salon
    fill_in "Nombre toillete", with: @location.nombre_toillete
    fill_in "Prix", with: @location.prix
    fill_in "Titre", with: @location.titre
    fill_in "Type", with: @location.type
    fill_in "User", with: @location.user_id
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "updating a Location" do
    visit locations_url
    click_on "Edit", match: :first

    fill_in "Adresse", with: @location.adresse
    fill_in "Description", with: @location.description
    check "Etat" if @location.etat
    fill_in "Nombre adulte", with: @location.nombre_adulte
    fill_in "Nombre chamber", with: @location.nombre_chamber
    fill_in "Nombre enfant", with: @location.nombre_enfant
    fill_in "Nombre salon", with: @location.nombre_salon
    fill_in "Nombre toillete", with: @location.nombre_toillete
    fill_in "Prix", with: @location.prix
    fill_in "Titre", with: @location.titre
    fill_in "Type", with: @location.type
    fill_in "User", with: @location.user_id
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "destroying a Location" do
    visit locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location was successfully destroyed"
  end
end
