require 'rails_helper'

RSpec.describe "sources/show", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :label => "Label",
      :category_id => "Category",
      :parent => "Parent",
      :link => "Link",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Parent/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Text/)
  end
end
