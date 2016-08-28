require 'rails_helper'

RSpec.describe "sources/index", type: :view do
  before(:each) do
    assign(:sources, [
      Source.create!(
        :label => "Label",
        :category_id => "Category",
        :parent => "Parent",
        :link => "Link",
        :text => "Text"
      ),
      Source.create!(
        :label => "Label",
        :category_id => "Category",
        :parent => "Parent",
        :link => "Link",
        :text => "Text"
      )
    ])
  end

  it "renders a list of sources" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Parent".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
