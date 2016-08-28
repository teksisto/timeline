require 'rails_helper'

RSpec.describe "outlines/edit", type: :view do
  before(:each) do
    @outline = assign(:outline, Outline.create!(
      :text => "MyString",
      :source_id => "MyString"
    ))
  end

  it "renders the edit outline form" do
    render

    assert_select "form[action=?][method=?]", outline_path(@outline), "post" do

      assert_select "input#outline_text[name=?]", "outline[text]"

      assert_select "input#outline_source_id[name=?]", "outline[source_id]"
    end
  end
end
