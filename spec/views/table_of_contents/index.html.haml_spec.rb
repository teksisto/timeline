require 'rails_helper'

RSpec.describe "table_of_contents/index", type: :view do
  before(:each) do
    assign(:table_of_contents, [
      TableOfContent.create!(
        :source => "Source"
      ),
      TableOfContent.create!(
        :source => "Source"
      )
    ])
  end

  it "renders a list of table_of_contents" do
    render
    assert_select "tr>td", :text => "Source".to_s, :count => 2
  end
end
