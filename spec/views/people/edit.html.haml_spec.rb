require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :label => "MyString",
      :description => "MyString",
      :screen_label => "MyString",
      :link => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input#person_label[name=?]", "person[label]"

      assert_select "input#person_description[name=?]", "person[description]"

      assert_select "input#person_screen_label[name=?]", "person[screen_label]"

      assert_select "input#person_link[name=?]", "person[link]"
    end
  end
end
