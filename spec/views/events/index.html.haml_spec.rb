require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :label => "Label",
        :description => "Description",
        :age => false,
        :period => false,
        :link => "Link"
      ),
      Event.create!(
        :label => "Label",
        :description => "Description",
        :age => false,
        :period => false,
        :link => "Link"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
