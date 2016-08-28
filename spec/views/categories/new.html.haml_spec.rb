require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :label => "MyString",
      :description => "MyString",
      :icon => "MyString",
      :color => "MyString"
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_label[name=?]", "category[label]"

      assert_select "input#category_description[name=?]", "category[description]"

      assert_select "input#category_icon[name=?]", "category[icon]"

      assert_select "input#category_color[name=?]", "category[color]"
    end
  end
end
