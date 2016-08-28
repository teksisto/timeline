require 'rails_helper'

RSpec.describe "outlines/index", type: :view do
  before(:each) do
    assign(:outlines, [
      Outline.create!(
        :text => "Text",
        :source_id => "Source"
      ),
      Outline.create!(
        :text => "Text",
        :source_id => "Source"
      )
    ])
  end

  it "renders a list of outlines" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
  end
end
