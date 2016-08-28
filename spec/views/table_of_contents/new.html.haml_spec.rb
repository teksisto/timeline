require 'rails_helper'

RSpec.describe "table_of_contents/new", type: :view do
  before(:each) do
    assign(:table_of_content, TableOfContent.new(
      :source => "MyString"
    ))
  end

  it "renders new table_of_content form" do
    render

    assert_select "form[action=?][method=?]", table_of_contents_path, "post" do

      assert_select "input#table_of_content_source[name=?]", "table_of_content[source]"
    end
  end
end
