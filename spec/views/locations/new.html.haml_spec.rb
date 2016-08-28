require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :label => "MyString",
      :description => "MyString",
      :icon => "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_label[name=?]", "location[label]"

      assert_select "input#location_description[name=?]", "location[description]"

      assert_select "input#location_icon[name=?]", "location[icon]"
    end
  end
end