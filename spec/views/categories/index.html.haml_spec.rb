require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :label => "Label",
        :description => "Description",
        :icon => "Icon",
        :color => "Color"
      ),
      Category.create!(
        :label => "Label",
        :description => "Description",
        :icon => "Icon",
        :color => "Color"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
  end
end
