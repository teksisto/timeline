require 'rails_helper'

RSpec.describe "outlines/show", type: :view do
  before(:each) do
    @outline = assign(:outline, Outline.create!(
      :text => "Text",
      :source_id => "Source"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/Source/)
  end
end
