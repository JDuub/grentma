require "application_system_test_case"

class GrandmaIdsTest < ApplicationSystemTestCase
  setup do
    @grandma_id = grandma_ids(:one)
  end

  test "visiting the index" do
    visit grandma_ids_url
    assert_selector "h1", text: "Grandmas"
  end

  test "should create grandma" do
    visit grandma_ids_url
    click_on "New grandma"

    fill_in "Address", with: @grandma_id.address
    fill_in "Name", with: @grandma_id.name
    click_on "Create Grandma"

    assert_text "Grandma was successfully created"
    click_on "Back"
  end

  test "should update Grandma" do
    visit grandma_id_url(@grandma_id)
    click_on "Edit this grandma", match: :first

    fill_in "Address", with: @grandma_id.address
    fill_in "Name", with: @grandma_id.name
    click_on "Update Grandma"

    assert_text "Grandma was successfully updated"
    click_on "Back"
  end

  test "should destroy Grandma" do
    visit grandma_id_url(@grandma_id)
    click_on "Destroy this grandma", match: :first

    assert_text "Grandma was successfully destroyed"
  end
end
