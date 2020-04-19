require "application_system_test_case"

class AdressesTest < ApplicationSystemTestCase
  setup do
    @adress = adresses(:one)
  end

  test "visiting the index" do
    visit adresses_url
    assert_selector "h1", text: "Adresses"
  end

  test "creating a Adresse" do
    visit adresses_url
    click_on "New Adresse"

    fill_in "Libelle", with: @adress.libelle
    click_on "Create Adresse"

    assert_text "Adresse was successfully created"
    click_on "Back"
  end

  test "updating a Adresse" do
    visit adresses_url
    click_on "Edit", match: :first

    fill_in "Libelle", with: @adress.libelle
    click_on "Update Adresse"

    assert_text "Adresse was successfully updated"
    click_on "Back"
  end

  test "destroying a Adresse" do
    visit adresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adresse was successfully destroyed"
  end
end
