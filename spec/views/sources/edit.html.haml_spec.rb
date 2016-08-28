require 'rails_helper'

RSpec.describe "sources/edit", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :label => "MyString",
      :category_id => "MyString",
      :parent => "MyString",
      :link => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(@source), "post" do

      assert_select "input#source_label[name=?]", "source[label]"

      assert_select "input#source_category_id[name=?]", "source[category_id]"

      assert_select "input#source_parent[name=?]", "source[parent]"

      assert_select "input#source_link[name=?]", "source[link]"

      assert_select "input#source_text[name=?]", "source[text]"
    end
  end
end
