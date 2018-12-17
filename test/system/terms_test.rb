require "application_system_test_case"

class TermsTest < ApplicationSystemTestCase
  setup do
    @term = terms(:one)
  end

  test "visiting the index" do
    visit terms_url
    assert_selector "h1", text: "Terms"
  end

  test "creating a Term" do
    visit terms_url
    click_on "New Term"

    fill_in "Label", with: @term.label
    fill_in "Text", with: @term.text
    click_on "Create Term"

    assert_text "Term was successfully created"
    click_on "Back"
  end

  test "updating a Term" do
    visit terms_url
    click_on "Edit", match: :first

    fill_in "Label", with: @term.label
    fill_in "Text", with: @term.text
    click_on "Update Term"

    assert_text "Term was successfully updated"
    click_on "Back"
  end

  test "destroying a Term" do
    visit terms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Term was successfully destroyed"
  end
end
