require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :label => "Label",
      :description => "Description",
      :icon => "Icon",
      :color => "Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(/Color/)
  end
end
