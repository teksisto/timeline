require 'rails_helper'

RSpec.describe "outlines/new", type: :view do
  before(:each) do
    assign(:outline, Outline.new(
      :text => "MyString",
      :source_id => "MyString"
    ))
  end

  it "renders new outline form" do
    render

    assert_select "form[action=?][method=?]", outlines_path, "post" do

      assert_select "input#outline_text[name=?]", "outline[text]"

      assert_select "input#outline_source_id[name=?]", "outline[source_id]"
    end
  end
end
