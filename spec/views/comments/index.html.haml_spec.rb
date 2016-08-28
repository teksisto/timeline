require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :author_id => "Author",
        :quote_id => "Quote",
        :text => "Text"
      ),
      Comment.create!(
        :author_id => "Author",
        :quote_id => "Quote",
        :text => "Text"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Quote".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
