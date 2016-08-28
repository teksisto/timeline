require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :author_id => "MyString",
      :quote_id => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_author_id[name=?]", "comment[author_id]"

      assert_select "input#comment_quote_id[name=?]", "comment[quote_id]"

      assert_select "input#comment_text[name=?]", "comment[text]"
    end
  end
end
