require 'rails_helper'

RSpec.describe "table_of_contents/show", type: :view do
  before(:each) do
    @table_of_content = assign(:table_of_content, TableOfContent.create!(
      :source => "Source"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Source/)
  end
end
