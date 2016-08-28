require 'rails_helper'

RSpec.describe "quote_versions/show", type: :view do
  before(:each) do
    @quote_version = assign(:quote_version, QuoteVersion.create!(
      :quote_id => "Quote",
      :language => "Language",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Quote/)
    expect(rendered).to match(/Language/)
    expect(rendered).to match(/Text/)
  end
end
