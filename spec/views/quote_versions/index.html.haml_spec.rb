require 'rails_helper'

RSpec.describe "quote_versions/index", type: :view do
  before(:each) do
    assign(:quote_versions, [
      QuoteVersion.create!(
        :quote_id => "Quote",
        :language => "Language",
        :text => "Text"
      ),
      QuoteVersion.create!(
        :quote_id => "Quote",
        :language => "Language",
        :text => "Text"
      )
    ])
  end

  it "renders a list of quote_versions" do
    render
    assert_select "tr>td", :text => "Quote".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
