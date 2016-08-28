require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :label => "Label",
        :description => "Description",
        :screen_label => "Screen Label",
        :link => "Link"
      ),
      Person.create!(
        :label => "Label",
        :description => "Description",
        :screen_label => "Screen Label",
        :link => "Link"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Label".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
