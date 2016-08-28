require 'rails_helper'

RSpec.describe "quotes/index", type: :view do
  before(:each) do
    assign(:quotes, [
      Quote.create!(
        :label => "Label",
        :source_id => "Source"
      ),
      Quote.create!(
        :label => "Label",
        :source_id => "Source"
      )
    ])
  end

  it "renders a list of quotes" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
  end
end
