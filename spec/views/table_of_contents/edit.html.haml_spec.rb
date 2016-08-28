require 'rails_helper'

RSpec.describe "table_of_contents/edit", type: :view do
  before(:each) do
    @table_of_content = assign(:table_of_content, TableOfContent.create!(
      :source => "MyString"
    ))
  end

  it "renders the edit table_of_content form" do
    render

    assert_select "form[action=?][method=?]", table_of_content_path(@table_of_content), "post" do

      assert_select "input#table_of_content_source[name=?]", "table_of_content[source]"
    end
  end
end
