require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :label => "MyString",
      :description => "MyString",
      :icon => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_label[name=?]", "location[label]"

      assert_select "input#location_description[name=?]", "location[description]"

      assert_select "input#location_icon[name=?]", "location[icon]"
    end
  end
end
