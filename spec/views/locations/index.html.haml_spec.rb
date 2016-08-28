require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :label => "Label",
        :description => "Description",
        :icon => "Icon"
      ),
      Location.create!(
        :label => "Label",
        :description => "Description",
        :icon => "Icon"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
  end
end
