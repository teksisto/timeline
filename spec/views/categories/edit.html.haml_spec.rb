require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :label => "MyString",
      :description => "MyString",
      :icon => "MyString",
      :color => "MyString"
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_label[name=?]", "category[label]"

      assert_select "input#category_description[name=?]", "category[description]"

      assert_select "input#category_icon[name=?]", "category[icon]"

      assert_select "input#category_color[name=?]", "category[color]"
    end
  end
end
