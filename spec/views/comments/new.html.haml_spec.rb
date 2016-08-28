require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :author_id => "MyString",
      :quote_id => "MyString",
      :text => "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_author_id[name=?]", "comment[author_id]"

      assert_select "input#comment_quote_id[name=?]", "comment[quote_id]"

      assert_select "input#comment_text[name=?]", "comment[text]"
    end
  end
end
